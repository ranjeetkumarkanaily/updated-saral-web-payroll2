class Salary < ActiveRecord::Base

  def self.is_salary_generated? month_year, employee_id
    month_year = month_year.split('/')
    Salary.select("effective_date").where("extract(month from effective_date) = #{month_year[0]} and extract(year from effective_date) = #{month_year[1]} AND employee_id = #{employee_id}").count > 0
  end

  def self.get_salary_on_salary_type  salary_type, month_year, employee_id

    month_year = month_year.split('/')
    condition = "employee_id = " + employee_id + " and salary_type = '" + salary_type + "' and
                  extract(month from effective_date) = " + month_year[0] + " and
                  extract(year from effective_date) = " + month_year[1]

    @sals = Salary.select('head_name, sum(salary_amount) as Total').
        joins('inner join salary_heads on salary_head_id = salary_heads.id ').
        where(condition).group('head_name')
  end
end