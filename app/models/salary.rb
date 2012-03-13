class Salary < ActiveRecord::Base
  belongs_to :salary_head
  belongs_to :employee_detail

  def self.is_salary_generated? month_year, employee_id
    month_year = Date.strptime month_year, '%b/%Y'
    Salary.select("effective_date").where("extract(month from effective_date) = #{month_year.month} and extract(year from effective_date) = #{month_year.year} AND employee_id = #{employee_id}").count > 0
  end

  def self.get_salary_on_salary_type  salary_type, month_year, employee_id, with_zero_val=0
    month_year = Date.strptime month_year, '%b/%Y'
    zero_salary_amount = (with_zero_val==0)?" and salary_amount != 0":""

    condition = "employee_id = " + employee_id + " and salary_type = '" + salary_type + "' and
                  extract(month from effective_date) = #{month_year.month} and
                  extract(year from effective_date) = #{month_year.year} #{zero_salary_amount}"

    Salary.select('salary_head_id, sum(salary_amount) as salary_amount').
        joins(:salary_head).
        where(condition).group('salary_head_id').order('salary_head_id ASC')
  end

  def self.get_pf_amount month_year, employee_id=0
    month_year = Date.strptime month_year, '%b/%Y'
    puts employee_id
    condition_emp_id = (employee_id != 0)?" employee_id = " + employee_id + " and ":""
    condition = " #{condition_emp_id} salary_head_id = 1 and
                  extract(month from effective_date) = #{month_year.month} and
                  extract(year from effective_date) = #{month_year.year}"
    basic_amount = Salary.select('sum(salary_amount) as salary_amount').where(condition)

    condition = " #{condition_emp_id} salary_head_id = 2 and
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
    condition = " employee_id  = " + employee_id + " and salary_type = 'Earnings' and
                    extract(month from effective_date) = #{month_year.month} and
                    extract(year from effective_date) = #{month_year.year}"
    gross_salary = Salary.select('sum(salary_amount) as salary_amount').joins(:salary_head).where(condition)
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
    gross_salary = get_gross_salary month_year,employee_id
    month_year = Date.strptime month_year, '%b/%Y'
    pt_amount = PtRate.select('pt').joins(:paymonth).where("to_date <= '#{month_year.end_of_month}' and min_sal_range = (select max(min_sal_range) from pt_rates where min_sal_range < #{gross_salary.to_i})")

    if pt_amount.count > 0
      get_pt = pt_amount[0]['pt']
    else
      get_pt = nil
    end

  end

  def self.find_employees_leave from_date, to_date, employee_id
    LeaveDetail.select("count(employee_id) as leave_count").where("employee_id = #{employee_id} and leave_date between '#{from_date}' and '#{to_date}'" )
  end

  def self.salary_sheet month_year
    month_year_format = Date.strptime month_year, '%b/%Y'
    employee_list = Employee.employees_list month_year_format

    employee_salary_detail = []
    i=0
    employee_list.each do |emp_salary_data|
      leave_count = find_employees_leave month_year_format.beginning_of_month, month_year_format.end_of_month,emp_salary_data.id.to_s
      leave_count = leave_count[0]['leave_count'].to_i
      no_of_day_in_selected_month = Paymonth.select('number_of_days').where("to_date = '#{month_year_format.end_of_month}'")
      no_of_day_in_selected_month = no_of_day_in_selected_month[0]['number_of_days'].to_i

      employee_dol = Employee.chk_dol emp_salary_data.id
      if employee_dol
        no_of_day_if_dol_exist = employee_dol.day
        no_of_present_days = no_of_day_if_dol_exist - leave_count
      else
        no_of_present_days = no_of_day_in_selected_month - leave_count
      end

      salary_earning = get_salary_on_salary_type "Earnings", month_year,emp_salary_data.id.to_s,1
      salary_deduction = get_salary_on_salary_type "Deductions", month_year,emp_salary_data.id.to_s,1
      pf_amount = get_pf_amount month_year,emp_salary_data.id.to_s
      esi_amount = get_esi_amount month_year,emp_salary_data.id.to_s
      pt_amount = get_pt_amount month_year,emp_salary_data.id.to_s

      employee_salary_detail[i] = [:refno=>emp_salary_data.refno,:empname=>emp_salary_data.empname,:designation=>emp_salary_data.designation.designation,:paid_days=>no_of_present_days,:salary_earnings=>salary_earning,:pf=>pf_amount,:esi=>esi_amount,:pt=>pt_amount,:salary_deductions=>salary_deduction]
      i=i+1
    end

    employee_salary_detail
  end

  def self.salary_total month_year
    month_year_format = Date.strptime month_year, '%b/%Y'
    salary_earning_total = Salary.select("salary_heads.id,sum(salary_amount) as salary_amount").joins(:salary_head).where("effective_date='#{month_year_format.end_of_month}' and salary_type = 'Earnings'").group("salary_heads.id").order("salary_heads.id ASC")

    salary_deduction_total = Salary.select("salary_heads.id,sum(salary_amount) as salary_amount").joins(:salary_head).where("effective_date='#{month_year_format.end_of_month}' and salary_type = 'Deductions'").group("salary_heads.id").order("salary_heads.id ASC")

    grand_pf_total = get_pf_amount month_year,0

    employee_salary_total = [:salary_earnings_total=>salary_earning_total,:grand_pf=>grand_pf_total,:salary_deductions_total=>salary_deduction_total]
  end
end