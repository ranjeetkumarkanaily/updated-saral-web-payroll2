class HrCategoryDetail < ActiveRecord::Base
  attr_accessible :hr_category_id, :name, :data_type, :required
  acts_as_audited

  belongs_to :hr_category
  delegate :category_name, :to => :hr_category, :prefix => true
end
