class Designation < ActiveRecord::Base
  validates :designation,   :presence   => true,
            :uniqueness => { :case_sensitive => false }

  has_many :employees
end
