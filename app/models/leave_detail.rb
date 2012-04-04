class LeaveDetail < ActiveRecord::Base
  attr_accessible :employee_id, :leave_date, :created_at,:updated_at
  acts_as_audited

  belongs_to :employee, :validate => true
  validates_presence_of :leave_date, :employee_id
  validates_presence_of :employee, :message => " does not exists."
  validates_uniqueness_of :employee_id, :scope => :leave_date, :message => " Leave has already taken"
end
