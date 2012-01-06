class Department < ActiveRecord::Base
  validates :department,   :presence   => true,
            :uniqueness => { :case_sensitive => false }

  has_many :employees
end
