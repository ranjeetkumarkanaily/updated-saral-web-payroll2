class HrMaster < ActiveRecord::Base
  serialize :category_values, HstoreSerializer
  belongs_to :hr_category
  belongs_to :employee

  validate :validates_presence

  def validates_presence
    required_fields = HrCategoryDetail.select("name").where("required = 't' and hr_category_id = ?", hr_category_id)
    required_fields.each do |field|
      if validate field.name
        #puts field.name
        errors.add(:hr_master, "category values for \"#{field.name}\" is required")
      end
    end
  end

  def validate name
    #puts name
    #puts category_values.inspect
    #puts self.category_values
    #puts self.category_values[name]
    #puts category_values[name].empty?
    category_values[name].empty?
  end


  def self.hr_columns employee_id, category_id
    HrMaster.select("distinct hr_category_detail_id").where("employee_id = ? AND hr_category_id = ?",employee_id, category_id).order("hr_category_detail_id DESC")
  end
end
