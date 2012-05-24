class LeaveOpeningBalance < ActiveRecord::Base
  belongs_to :leave_definition
  belongs_to :employee
  attr_accessible :opening_balance,:employee_id, :leave_definition_id

  validates_uniqueness_of :opening_balance, :scope => [:employee_id, :leave_definition_id],:message => "Details already exist for the same Employee/s"
end
