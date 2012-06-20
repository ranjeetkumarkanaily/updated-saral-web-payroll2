class SalaryGroup < ActiveRecord::Base
  attr_accessible :salary_group_name, :based_on_gross
  acts_as_audited

  has_many :salary_group_details, :dependent => :destroy
  has_many :employee_details, :dependent => :restrict
  has_many :every_month_comp_values

  validates :salary_group_name,
                  :presence => true,
                  :length   => {:maximum => 100},
                  :uniqueness => { :case_sensitive => true }

  scope :salary_groups, :order => 'created_at ASC'

  scope :assigned_salary_group, lambda {
    SalaryGroup.select("DISTINCT(salary_groups.id),salary_groups.created_at, salary_group_name").joins(:employee_details).order("salary_groups.created_at ASC")
  }

end
