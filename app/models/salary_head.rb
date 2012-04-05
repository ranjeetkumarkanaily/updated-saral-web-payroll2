class SalaryHead < ActiveRecord::Base
  attr_accessible :id,:head_name, :short_name, :salary_type,:created_at,:updated_at
  acts_as_audited

  has_many :salary_group_details
  has_many :salary_allotments
  has_many :salaries

  validates :head_name, :uniqueness => true
  validates :short_name, :uniqueness => { :case_sensitive => false }


  scope :salary_heads,   lambda {|head| where(:salary_type => head).order("created_at ASC") }
end
