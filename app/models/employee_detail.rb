class EmployeeDetail < ActiveRecord::Base

  belongs_to :employee
  belongs_to :salary_group
end
