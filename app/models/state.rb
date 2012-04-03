class State < ActiveRecord::Base
  acts_as_audited

  has_many :employees

  validates :state_name,   :presence   => true,
                    :uniqueness => { :case_sensitive => false }
end
