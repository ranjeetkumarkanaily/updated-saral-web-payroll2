class State < ActiveRecord::Base
  attr_accessible :state_name
  acts_as_audited

  has_many :employees

  validates :state_name,   :presence   => true,
                    :uniqueness => { :case_sensitive => false }

  scope :all_states, :order => 'state_name ASC'
end
