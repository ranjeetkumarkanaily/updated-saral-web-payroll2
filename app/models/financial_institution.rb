class FinancialInstitution < ActiveRecord::Base
  validates :name, :presence => true,
            :uniqueness => { :case_sensitive => false }
  validates :pincode, :numericality => true

  has_many :employee_details
end
