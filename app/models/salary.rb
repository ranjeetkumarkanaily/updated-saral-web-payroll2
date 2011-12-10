class Salary < ActiveRecord::Base
  scope :get_salary, lambda { |effective_date|
    where(:effective_date => effective_date).order('employee_id ASC')
  }
end