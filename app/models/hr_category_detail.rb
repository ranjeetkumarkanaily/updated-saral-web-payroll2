class HrCategoryDetail < ActiveRecord::Base
  acts_as_audited

  belongs_to :hr_category
end
