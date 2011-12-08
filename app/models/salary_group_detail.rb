class SalaryGroupDetail < ActiveRecord::Base
  belongs_to :salary_group
  belongs_to :salary_head
end
