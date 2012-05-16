class EsiCalculatedValue < ActiveRecord::Base
  attr_accessible :esi_gross, :esi_amount, :esi_employer_amount,:employee_id,:effective_date
  acts_as_audited

end