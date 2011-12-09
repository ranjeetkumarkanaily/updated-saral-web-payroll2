class SalaryGroup < ActiveRecord::Base
  has_many :salary_group_details
  has_many :employee_details, :dependent => :destroy

  validates :salary_group_name,
                  :presence => true,
                  :length   => {:maximum => 100},
                  :uniqueness => { :case_sensitive => true }

end
