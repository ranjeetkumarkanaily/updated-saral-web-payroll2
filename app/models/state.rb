class State < ActiveRecord::Base
  attr_accessible :id,:state_name, :created_at,:updated_at
  acts_as_audited

  has_many :employees

  validates :state_name,   :presence   => true,
                    :uniqueness => { :case_sensitive => false }
end
