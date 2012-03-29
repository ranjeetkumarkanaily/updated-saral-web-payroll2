class Branch < ActiveRecord::Base
  acts_as_audited

  belongs_to :pf_group
  belongs_to :esi_group
  belongs_to :pt_group


  validates :branch_name, :presence => true
  validates :responsible_person, :presence => true
  validates :address, :presence => true
  validates :pf_group_id, :presence => true
  validates :pt_group_id, :presence => true
end
