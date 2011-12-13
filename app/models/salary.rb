class Salary < ActiveRecord::Base

  def self.is_salary_generated? month_year, employee_id
    month_year = month_year.split('/')
    Salary.select("effective_date").where("extract(month from effective_date) = #{month_year[0]} and extract(year from effective_date) = #{month_year[1]} AND employee_id = #{employee_id}").count > 0
  end
end