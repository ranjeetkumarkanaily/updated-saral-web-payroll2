class PfGroup < ActiveRecord::Base
  attr_accessible :id,:pf_group, :pf_number, :db_file_code, :extension,:address, :created_at,:updated_at
  acts_as_audited

  has_many :pf_group_rates, :dependent => :destroy

  has_many :branches

  validates :pf_group,   :presence   => true,
            :uniqueness => { :case_sensitive => false }

  validates :pf_number,   :presence   => true,
            :uniqueness => { :case_sensitive => false }

  validates_presence_of :address

  validates :extension, :numericality => true,
            :length => {:maximum => 1}

  scope :pf_groups, :order => 'created_at ASC'
end
