class SalaryGroupDetail < ActiveRecord::Base
  belongs_to :salary_group
  belongs_to :salary_head
  has_many :salary_allotments
  has_many :salaries

  validates_uniqueness_of :salary_group_id, :scope => :salary_head_id, :message => ": Salary Head have already taken"
end
