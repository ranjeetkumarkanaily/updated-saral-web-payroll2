class PfCalculatedValue < ActiveRecord::Base
  attr_accessible :pf_earning, :pf_amount, :epf_amount, :eps_amount,:vol_pf_amount,:employee_id,:effective_date
  acts_as_audited

end