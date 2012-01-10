class Salary < ActiveRecord::Base
  belongs_to :salary_head
  belongs_to :employee_detail

  def self.is_salary_generated? month_year, employee_id
    month_year = Date.strptime month_year, '%b/%Y'
    Salary.select("effective_date").where("extract(month from effective_date) = #{month_year.month} and extract(year from effective_date) = #{month_year.year} AND employee_id = #{employee_id}").count > 0
  end

  def self.get_salary_on_salary_type  salary_type, month_year, employee_id
    month_year = Date.strptime month_year, '%b/%Y'

    condition = "employee_id = " + employee_id + " and salary_type = '" + salary_type + "' and
                  extract(month from effective_date) = #{month_year.month} and
                  extract(year from effective_date) = #{month_year.year}"
    Salary.select('head_name, sum(salary_amount) as salary_amount').
        joins('inner join salary_heads on salary_head_id = salary_heads.id ').
        where(condition).group('head_name')
  end

  def self.get_pf_amount month_year, employee_id
    month_year = Date.strptime month_year, '%b/%Y'

    condition = " employee_id = " + employee_id + " and salary_head_id = 1 and
                  extract(month from effective_date) = #{month_year.month} and
                  extract(year from effective_date) = #{month_year.year}"
    basic_amount = Salary.select('sum(salary_amount) as salary_amount').where(condition)

    condition = " employee_id = " + employee_id + " and salary_head_id = 2 and
                  extract(month from effective_date) = #{month_year.month} and
                  extract(year from effective_date) = #{month_year.year}"
    da_amount = Salary.select('sum(salary_amount) as salary_amount').where(condition)

    pf_rate_value = PfEsiRate.last

    if((basic_amount[0]['salary_amount'] + da_amount[0]['salary_amount']) >= pf_rate_value.pf_cutoff)
      pf_amount = (pf_rate_value.pf_cutoff)*pf_rate_value.pf_rate/100
    else
      pf_amount = ((basic_amount[0]['salary_amount'] + da_amount[0]['salary_amount'])*(pf_rate_value.pf_rate/100)).round.to_f
    end
  end

  def self.get_gross_salary month_year, employee_id
    month_year = Date.strptime month_year, '%b/%Y'
    condition = " employee_id = " + employee_id + " and salary_type = 'Earnings' and
                    extract(month from effective_date) = #{month_year.month} and
                    extract(year from effective_date) = #{month_year.year}"
    gross_salary = Salary.select('sum(salary_amount) as salary_amount').joins('inner join salary_heads on salary_head_id = salary_heads.id ').where(condition)
    gross_salary = gross_salary[0]['salary_amount']
  end

  def self.get_esi_amount  month_year, employee_id
    gross_salary = get_gross_salary month_year, employee_id
    esi_rate_value = PfEsiRate.last

    if gross_salary < esi_rate_value.esi_cutoff
      esi_amount = (gross_salary*(esi_rate_value.esi_employee_rate/100)).round.to_f
    else
      esi_amount = nil
    end
  end

  def self.get_pt_amount month_year, employee_id
    gross_salary = get_gross_salary month_year, employee_id
    month_year = Date.strptime month_year, '%b/%Y'
    pt_amount = PtRate.select('pt').joins('inner join paymonths on paymonth_id = paymonths.id').where("to_date <= '#{month_year.end_of_month}' and #{gross_salary.to_i} between min_sal_range and max_sal_range")

    if pt_amount.count > 0
      get_pt = pt_amount[0]['pt']
    else
      get_pt = PtRate.select('pt').joins('inner join paymonths on paymonth_id = paymonths.id').where("to_date <= '#{month_year.end_of_month}' and #{gross_salary.to_i} >= min_sal_range").order('pt_rates.id DESC LIMIT 1')
      get_pt = get_pt[0]['pt']
    end
  end

  def self.find_employees_leave from_date, to_date, employee_id
    LeaveDetail.select("count(employee_id) as leave_count").where("employee_id = #{employee_id} and leave_date between '#{from_date} 'and '#{to_date}'" )
  end
end