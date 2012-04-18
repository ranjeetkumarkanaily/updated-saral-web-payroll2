class Branch < ActiveRecord::Base
  attr_accessible :branch_name, :responsible_person, :address, :pf_group_id, :esi_group_id, :pt_group_id, :esi_applicable
  acts_as_audited

  #belongs_to :pf_group
  #belongs_to :esi_group
  #belongs_to :pt_group

  has_many :branch_pf_details
  has_many :branch_pt_details
  has_many :branch_esi_details
  #delegate :pf_group, :to => :pf_group, :prefix => true
  #delegate :esi_group_name, :to => :esi_group, :prefix => true
  #delegate :name, :to => :pt_group, :prefix => true


  validates :branch_name, :presence => true
  validates :responsible_person, :presence => true
  validates :address, :presence => true
  #validates :pf_group_id, :presence => true
  #validates :pt_group_id, :presence => true

  scope :branches, :order => 'created_at ASC'

  def pf_group_name
    self.branch_pf_details.order('created_at DESC').first
  end

  def pt_group_name
    self.branch_pt_details.order('created_at DESC').first
  end

  def esi_group_name
    self.branch_esi_details.order('created_at DESC').first
  end

end
