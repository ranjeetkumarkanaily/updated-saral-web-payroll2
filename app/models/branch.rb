class Branch < ActiveRecord::Base
  attr_accessible :branch_name, :responsible_person, :address, :pf_group_id, :esi_group_id, :pt_group_id, :esi_applicable
  acts_as_audited

  has_many :branch_pf_details
  has_many :branch_pt_details
  has_many :branch_esi_details

  validates :branch_name, :presence => true
  validates :responsible_person, :presence => true
  validates :address, :presence => true

  scope :branches, :order => 'created_at ASC'

  def pf_detail
    self.branch_pf_details.order('created_at DESC').first
  end

  def pt_detail
    self.branch_pt_details.order('created_at DESC').first
  end

  def esi_detail
    self.branch_esi_details.order('created_at DESC').first
  end

  def update_pf_group
    pf_grp_id = pf_detail ? pf_detail.pf_group_id : nil
    update_attribute("pf_group_id", pf_grp_id)
  end

  def update_pt_group
    pt_grp_id = pt_detail ? pt_detail.pt_group_id : nil
    update_attribute("pt_group_id", pt_grp_id)
  end

  def update_esi_group
    esi_grp_id = esi_detail ? esi_detail.esi_group_id : nil
    update_attribute("esi_group_id", esi_grp_id)
  end

end
