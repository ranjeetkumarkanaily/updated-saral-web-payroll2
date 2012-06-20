class PfGroup < ActiveRecord::Base
  attr_accessible :pf_group, :pf_number, :db_file_code, :extension,:address
  acts_as_audited

  has_many :pf_group_rates, :dependent => :destroy

  has_many :branches, :dependent => :restrict
  has_many :pf_details

  validates :pf_group,   :presence   => true,
            :uniqueness => { :case_sensitive => false }

  validates :pf_number,   :presence   => true,
            :uniqueness => { :case_sensitive => false }

  validates_presence_of :address

  validates :extension, :numericality => true,
            :length => {:maximum => 1},:if => :extension_exist?

  scope :pf_groups, :order => 'created_at ASC'


  def extension_exist?
    !extension.blank? and !extension.nil?
  end
end
