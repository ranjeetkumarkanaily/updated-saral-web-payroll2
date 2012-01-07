class Grade < ActiveRecord::Base
  validates :grade,   :presence   => true,
            :uniqueness => { :case_sensitive => false }

  has_many :employees
end
