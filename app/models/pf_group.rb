class PfGroup < ActiveRecord::Base
  has_many :pf_group_rates, :dependent => :destroy

  has_many :branches

  validates :pf_group,   :presence   => true,
            :uniqueness => { :case_sensitive => false }

  validates :pf_number,   :presence   => true,
            :uniqueness => { :case_sensitive => false }

  validates_presence_of :address

  validates :extension, :numericality => true,
            :length => {:maximum => 1}

end
