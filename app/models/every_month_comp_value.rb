class EveryMonthCompValue < ActiveRecord::Base
  attr_accessible :paymonth_id, :employee_id, :salary_group_id, :salary_amount
  acts_as_audited
end