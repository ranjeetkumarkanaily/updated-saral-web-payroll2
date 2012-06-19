class EveryMonthCompValue < ActiveRecord::Base
  attr_accessible :paymonth_id, :employee_id, :salary_group_id, :salary_amount
  acts_as_audited

  serialize :salary_amount, ActiveRecord::Coders::Hstore

  belongs_to :employee
  belongs_to :salary_group
  belongs_to :paymonth
end

