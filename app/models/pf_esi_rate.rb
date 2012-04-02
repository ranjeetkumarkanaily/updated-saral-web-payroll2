class PfEsiRate < ActiveRecord::Base
  acts_as_audited

  belongs_to :paymonth
  delegate :month_name, :to => :paymonth, :prefix => true

  validates_presence_of :paymonth_id, :pf_rate, :esi_employee_rate, :esi_employer_rate
  validates_uniqueness_of :paymonth_id
end
