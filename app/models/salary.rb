class Salary < ActiveRecord::Base
  acts_as_audited

  belongs_to :salary_head
  belongs_to :employee_detail
  belongs_to :salary_group_detail

  delegate :head_name, :to => :salary_head, :prefix => true

  def self.is_salary_generated? month_year, employee_id
    month_year = Date.strptime month_year, '%b/%Y'
    Salary.select("effective_date").where("extract(month from effective_date) = #{month_year.month} and extract(year from effective_date) = #{month_year.year} AND employee_id = #{employee_id}").count > 0
  end

  def self.get_salary_on_salary_type  salary_type, month_year, employee_id, with_zero_val=0
    month_year = Date.strptime month_year, '%b/%Y'
    zero_salary_amount = (with_zero_val==0)?" and salary_amount != 0":""

    condition = "salaries.employee_id = " + employee_id + " and salary_type = '" + salary_type + "' and
                  extract(month from effective_date) = #{month_year.month} and
                  extract(year from effective_date) = #{month_year.year} #{zero_salary_amount}"

    Salary.select('salaries.salary_head_id, sum(salary_amount) as salary_amount,salaries.salary_group_detail_id,print_name,print_order').joins(:salary_head).joins('LEFT OUTER JOIN "salary_group_details" ON "salary_group_details"."salary_head_id" = "salaries"."salary_head_id"').where(condition).group('salaries.salary_head_id, print_name, print_order, salaries.id, salary_group_details.id').order('print_order ASC')
  end

  def self.get_pf_amount month_year, employee_id
    month_year = Date.strptime month_year, '%b/%Y'

    pf_applicable_salary_amount = Salary.select('salary_amount').joins(:salary_group_detail).where("pf_applicability = true and employee_id = #{employee_id} and effective_date = '#{month_year.beginning_of_month}'")

    @pf_applicable_sal = 0
    pf_applicable_salary_amount.each do |pf_appli_sal|
       @pf_applicable_sal = @pf_applicable_sal+pf_appli_sal.salary_amount
    end

    employee_branch = EmployeeDetail.employee_branch month_year,employee_id
    employee_pf_group = Branch.find(employee_branch[0]['branch_id']).pf_group_id
    pf_rate_value = PfGroupRate.pf_rate month_year,employee_pf_group

    if(@pf_applicable_sal >= pf_rate_value[0]['cutoff'])
      pf_amount = (pf_rate_value[0]['cutoff'])*pf_rate_value[0]['epf']/100
    else
      pf_amount = ((@pf_applicable_sal)*(pf_rate_value[0]['epf']/100)).round.to_f
    end
  end

  def self.get_gross_salary month_year, employee_id
    month_year = Date.strptime month_year, '%b/%Y'
    condition = " employee_id  = #{employee_id} and salary_type = 'Earnings' and
                    extract(month from effective_date) = #{month_year.month} and
                    extract(year from effective_date) = #{month_year.year}"
    gross_salary = Salary.select('sum(salary_amount) as salary_amount').joins(:salary_head).where(condition)
    gross_salary = gross_salary[0]['salary_amount']
  end

  def self.get_esi_amount  month_year, employee_id
    gross_salary = get_gross_salary month_year, employee_id
    month_year = Date.strptime month_year, '%b/%Y'
    employee_branch = EmployeeDetail.employee_branch month_year,employee_id
    employee_esi_group = Branch.find(employee_branch[0]['branch_id']).esi_group_id
    if employee_esi_group != nil
      esi_rate_value = EsiGroupRate.find_by_esi_group_id(employee_esi_group)
      if gross_salary <= esi_rate_value[:cut_off]
        esi_amount = (gross_salary*(esi_rate_value[:employee_rate]/100)).round.to_f
      else
        esi_amount = 0
      end
    else
      esi_amount = 0
    end
  end

  def self.get_pt_amount month_year, employee_id
    gross_salary = get_gross_salary month_year,employee_id
    month_year = Date.strptime month_year, '%b/%Y'
    pt_amount = PtRate.select('pt').joins(:paymonth).where("to_date <= '#{month_year.end_of_month}' and min_sal_range = (select max(min_sal_range) from pt_rates where min_sal_range < #{gross_salary.to_i})")

    if pt_amount.count > 0
      get_pt = pt_amount[0]['pt']
    else
      get_pt = 0
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
      pt_amount = get_pt_amount month_year,emp_salary_data.id.to_s

      employee_salary_detail[i] = [:refno=>emp_salary_data.refno,:empname=>emp_salary_data.empname,:paid_days=>no_of_present_days,:salary_earnings=>salary_earning,:pt=>pt_amount,:salary_deductions=>salary_deduction]
      i=i+1
    end

    employee_salary_detail
  end

  def self.salary_total month_year
    month_year_format = Date.strptime month_year, '%b/%Y'
    salary_earning_total = Salary.select("salary_heads.id,sum(salary_amount) as salary_amount").joins(:salary_head).where("effective_date='#{month_year_format.beginning_of_month}' and salary_type = 'Earnings'").group("salary_heads.id").order("salary_heads.id ASC")

    salary_deduction_total = Salary.select("salary_heads.id,sum(salary_amount) as salary_amount").joins(:salary_head).where("effective_date='#{month_year_format.beginning_of_month}' and salary_type = 'Deductions'").group("salary_heads.id").order("salary_heads.id ASC")

    employee_salary_total = [:salary_earnings_total=>salary_earning_total,:salary_deductions_total=>salary_deduction_total]
  end

end