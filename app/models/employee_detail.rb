class EmployeeDetail < ActiveRecord::Base

  belongs_to :employees
  belongs_to :salary_groups
end
