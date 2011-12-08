class SalaryHead < ActiveRecord::Base
  has_many :salary_group_details
end
