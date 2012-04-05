class FinancialInstitution < ActiveRecord::Base
  attr_accessible :id,:name, :address_line1, :address_line2, :address_line3, :address_line4, :pincode,:branch_code,:email, :created_at,:updated_at
  acts_as_audited

  validates :name, :presence => true,
            :uniqueness => { :case_sensitive => false }
  validates :pincode, :numericality => true

  has_many :employee_details
end
