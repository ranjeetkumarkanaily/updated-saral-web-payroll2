class FinancialInstitution < ActiveRecord::Base
  attr_accessible :name, :address_line1, :address_line2, :address_line3, :address_line4, :pincode,:branch_code,:email
  acts_as_audited

  validates :name, :presence => true,
            :uniqueness => { :case_sensitive => false }
  validates :pincode, :numericality => true

  has_many :employee_details

  scope :financial_institutions, :order => 'created_at ASC'
end
