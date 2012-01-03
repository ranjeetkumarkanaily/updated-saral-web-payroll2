class LeaveDetail < ActiveRecord::Base
  belongs_to :employee, :validate => true
  validates_presence_of :leave_date, :employee_id
  validates_presence_of :employee, :message => " does not exists."
  validates_uniqueness_of :employee_id, :scope => :leave_date, :message => " Leave has already taken"
end
