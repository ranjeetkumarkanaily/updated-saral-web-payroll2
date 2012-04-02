class HrCategory < ActiveRecord::Base
  acts_as_audited

  has_many :hr_category_details
  validates_uniqueness_of :category_name
end
