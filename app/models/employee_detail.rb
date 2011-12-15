class EmployeeDetail < ActiveRecord::Base

  belongs_to :employee
  belongs_to :salary_group
  has_many :salary_allotments, :dependent => :destroy
  has_many :salaries, :dependent => :destroy

  validates_presence_of :employee_id, :salary_group_id, :effective_date

  validates_uniqueness_of :employee_id, :scope => [:effective_date]
end
