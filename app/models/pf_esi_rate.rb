class PfEsiRate < ActiveRecord::Base
  belongs_to :paymonth
  validates_presence_of :paymonth_id, :pf_rate, :esi_employee_rate, :esi_employer_rate
  validates_uniqueness_of :paymonth_id
end
