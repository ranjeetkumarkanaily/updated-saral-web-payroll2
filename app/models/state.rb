class State < ActiveRecord::Base
  has_many :employees

  validates :state_name,   :presence   => true,
                    :uniqueness => { :case_sensitive => false }
end
