class Branch < ActiveRecord::Base
  attr_accessible :branch_name, :responsible_person, :address, :pf_group_id, :esi_group_id, :pt_group_id, :esi_applicable
  acts_as_audited

  belongs_to :pf_group
  belongs_to :esi_group
  belongs_to :pt_group

  delegate :pf_group, :to => :pf_group, :prefix => true
  delegate :esi_group_name, :to => :esi_group, :prefix => true
  delegate :name, :to => :pt_group, :prefix => true


  validates :branch_name, :presence => true
  validates :responsible_person, :presence => true
  validates :address, :presence => true
  validates :pf_group_id, :presence => true
  validates :pt_group_id, :presence => true

  scope :branches, :order => 'created_at ASC'
end
