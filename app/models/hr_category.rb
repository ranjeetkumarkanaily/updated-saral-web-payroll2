class HrCategory < ActiveRecord::Base
  has_many :hr_category_details
  validates_uniqueness_of :category_name
end
