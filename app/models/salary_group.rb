class SalaryGroup < ActiveRecord::Base
  attr_accessible :id,:salary_group_name, :based_on_gross, :created_at,:updated_at
  acts_as_audited

  has_many :salary_group_details
  has_many :employee_details, :dependent => :destroy

  validates :salary_group_name,
                  :presence => true,
                  :length   => {:maximum => 100},
                  :uniqueness => { :case_sensitive => true }

end
