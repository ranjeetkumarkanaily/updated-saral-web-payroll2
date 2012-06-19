class HrMaster < ActiveRecord::Base
  attr_accessible :hr_category_id, :employee_id, :category_values
  acts_as_audited

  serialize :category_values, ActiveRecord::Coders::Hstore
  belongs_to :hr_category
  belongs_to :employee

  validate :validates_presence

  delegate :empname, :refno, :to => :employee, :prefix => true
  delegate :category_name, :to => :hr_category, :prefix => true

  def validates_presence
    required_fields = HrCategoryDetail.select("name").where("required = 't' and hr_category_id = ?", hr_category_id)
    required_fields.each do |field|
      if validate field.name
        errors.add(:hr_master, "category values for \"#{field.name}\" is required")
      end
    end
  end

  def validate name
    self["category_values"]["#{name}"].blank?
  end

end
