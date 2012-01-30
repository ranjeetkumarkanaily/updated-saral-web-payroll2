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

  def self.get_employee_with_salary_not_allotted
     Employee.select("DISTINCT(employees.id),refno,empname,department_id,designation_id,date_of_joining").joins("INNER JOIN salary_allotments s ON employees.id = s.employee_id").where("s.salary_allotment = 0")
  end

  def self.get_employee_with_salary_allotted
    Employee.select("DISTINCT(employees.id),refno,empname,department_id,designation_id,date_of_joining").joins("INNER JOIN salary_allotments s ON employees.id = s.employee_id").where("s.salary_allotment > 0")
  end

  def self.get_allotted_salaries month_year, employee_id
    month_year = Date.strptime month_year, '%b/%Y'
    SalaryAllotment.where("extract(month from effective_date) = #{month_year.month} and extract(year from effective_date) = #{month_year.year} AND employee_id = #{employee_id}").order("salary_head_id ASC")
  end

  def self.get_allotted_salaries_for_max_effective_date month_year, employee_id
    month_year = Date.strptime month_year, '%b/%Y'
    SalaryAllotment.select("id, employee_id, employee_detail_id,date_trunc('month', date('#{month_year.year}-#{month_year.month}-01') + '1 month'::interval) - '1 day'::interval as effective_date, salary_head_id, salary_allotment").where("employee_id = #{employee_id} and effective_date = (select MAX(effective_date) from salary_allotments where employee_id = #{employee_id})").order("salary_head_id ASC")
  end

end