class SalaryGroupDetail < ActiveRecord::Base
  attr_accessible :calc_type, :calculation,:based_on,:salary_group_id,:salary_head_id,:pf_applicability,:pf_percentage,:print_name,:print_order,:esi_applicability,:esi_percentage
  acts_as_audited

  belongs_to :salary_group
  belongs_to :salary_head
  has_many :salary_allotments
  has_many :salaries

  delegate :head_name, :to => :salary_head, :prefix => true
  delegate :salary_group_name, :to => :salary_group, :prefix => true

  validates_uniqueness_of :salary_group_id, :scope => :salary_head_id, :message => ": Salary Head have already taken"

  scope :salary_group_details, lambda {
    |sal_grp_id|
    {
        :conditions => ["salary_group_id = ?", sal_grp_id]
    }
  }
end
