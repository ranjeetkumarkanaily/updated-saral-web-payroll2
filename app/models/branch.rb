class Branch < ActiveRecord::Base
  belongs_to :pf_group
  belongs_to :esi_group
  belongs_to :pt_group
end
