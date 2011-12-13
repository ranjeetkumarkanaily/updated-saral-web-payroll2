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
    month_year = month_year.split('/')
    SalaryAllotment.where("extract(month from effective_date) = #{month_year[0]} and extract(year from effective_date) = #{month_year[1]} AND employee_id = #{employee_id}")
  end

  def self.get_allotted_salaries_for_max_effective_date employee_id
    SalaryAllotment.where("employee_id = #{employee_id} and effective_date = (select MAX(effective_date) from salary_allotments where employee_id = #{employee_id})")
  end

end