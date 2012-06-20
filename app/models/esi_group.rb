class EsiGroup < ActiveRecord::Base
  attr_accessible :esi_group_name, :address, :esi_no, :esi_local_office
  acts_as_audited

  validates_presence_of :esi_group_name, :address, :esi_no
  validates_uniqueness_of :esi_group_name

  has_many :branches, :dependent => :restrict
  has_many :esi_group_rates,:dependent => :destroy
  has_many :esi_details

  scope :esi_groups, :order => 'created_at ASC'
end
