class SalaryHead < ActiveRecord::Base
  attr_accessible :head_name, :short_name, :salary_type
  acts_as_audited

  has_many :salary_group_details, :dependent => :restrict
  has_many :salaries
  has_many :salary_allotments

  validates :head_name, :uniqueness => true
  validates :short_name, :uniqueness => { :case_sensitive => false }


  scope :salary_heads,   lambda {|head| where(:salary_type => head).order("created_at ASC") }

  scope :salary_heads_by_type,   lambda {|head| where(:salary_type => head).order("created_at ASC") }
end
