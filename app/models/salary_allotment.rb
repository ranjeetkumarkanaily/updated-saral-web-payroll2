class SalaryAllotment < ActiveRecord::Base
  belongs_to :salary_head
  belongs_to :employee_detail

  def salaryHead
    SalaryHead.find(salary_head_id).head_name
  end

  def shortName
    SalaryHead.find(salary_head_id).short_name
  end

  def salaryHeadType
    SalaryHead.find(salary_head_id).salary_type
  end

  def self.get_allotted_salaries month_year, employee_id
    month_year = Date.strptime month_year, '%b/%Y'
    SalaryAllotment.where("extract(month from effective_date) = #{month_year.month} and extract(year from effective_date) = #{month_year.year} AND employee_id = #{employee_id}")
  end

  def self.get_allotted_salaries_for_max_effective_date month_year, employee_id
    month_year = month_year.split('/')
    SalaryAllotment.select("id, employee_id, employee_detail_id,date_trunc('month', date('#{month_year[1]}-#{month_year[0]}-01') + '1 month'::interval) - '1 day'::interval as effective_date, salary_head_id, salary_allotment").where("employee_id = #{employee_id} and effective_date = (select MAX(effective_date) from salary_allotments where employee_id = #{employee_id})")
  end

end