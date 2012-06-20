class State < ActiveRecord::Base
  attr_accessible :state_name
  acts_as_audited

  has_many :employees, :dependent => :restrict, :foreign_key => 'present_state_id'

  validates :state_name,   :presence   => true,
                    :uniqueness => { :case_sensitive => false }

  scope :all_states, :order => 'state_name ASC'
end
