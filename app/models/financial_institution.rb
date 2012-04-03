class FinancialInstitution < ActiveRecord::Base
  acts_as_audited

  validates :name, :presence => true,
            :uniqueness => { :case_sensitive => false }
  validates :pincode, :numericality => true

  has_many :employee_details
end
