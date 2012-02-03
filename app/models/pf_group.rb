class PfGroup < ActiveRecord::Base
  validates :pf_group,   :presence   => true,
            :uniqueness => { :case_sensitive => false }

  validates :pf_number,   :presence   => true,
            :uniqueness => { :case_sensitive => false }

  validates_presence_of :address

  validates :extension, :numericality => true,
            :length => {:maximum => 1}

end
