class HrCategory < ActiveRecord::Base
  attr_accessible :category_name

  acts_as_audited

  has_many :hr_category_details
  validates_uniqueness_of :category_name
end
