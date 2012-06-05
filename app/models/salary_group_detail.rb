class SalaryGroupDetail < ActiveRecord::Base
  attr_accessible :calc_type, :calculation,:based_on,:salary_group_id,:salary_head_id,:pf_applicability,:print_name,:print_order,:esi_applicability,:pt_applicability,:effective_month,:calc_priority_no
  acts_as_audited

  belongs_to :salary_group
  belongs_to :salary_head
  has_many :salary_allotments
  has_many :salaries

  delegate :head_name, :to => :salary_head, :prefix => true
  delegate :salary_group_name, :to => :salary_group, :prefix => true

  #validates_uniqueness_of :salary_group_id, :scope => :salary_head_id, :message => ": Salary Head have already taken"

  scope :salary_group_details, lambda {
    |sal_grp_id|
    {
        :conditions => ["salary_group_id = ?", sal_grp_id]
    }
  }

  scope :based_on, lambda { |sal_grp_det_id|
     select("based_on").where("id = ?",sal_grp_det_id)
  }

  scope :all_salary_group_details, lambda { |sal_grp_id|
    select("DISTINCT ON (salary_head_id) id, salary_head_id, calc_type, effective_month, based_on").where("salary_group_id = #{sal_grp_id}").order("salary_head_id, created_at DESC")
  }

  scope :previous_salary_grp_details, lambda { |sal_grp_id, sal_head_id|
    where("id NOT IN (select MAX(id) from salary_group_details where salary_head_id = #{sal_head_id} and salary_group_id = #{sal_grp_id}) and salary_head_id = #{sal_head_id} and salary_group_id = #{sal_grp_id}")
  }

  def self.chk_effective_month month_year, id
    SalaryGroupDetail.where("effective_month = '#{month_year}' and id = #{id}")
  end

  def effective_to_month
    next_row = self.class.first(:conditions => ["created_at > ? and salary_head_id = ? and salary_group_id = ?", created_at, salary_head_id, salary_group_id ], :order => "created_at ASC")
    effective_month_db = next_row.effective_month
    parse_effective_month = Date.strptime effective_month_db, '%b/%Y'
    parse_effective_month - 1
  end

end
