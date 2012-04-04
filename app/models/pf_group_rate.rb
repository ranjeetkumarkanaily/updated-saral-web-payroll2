class PfGroupRate < ActiveRecord::Base
  attr_accessible :pf_group_id, :paymonth_id, :account_number_21, :pension_fund,:epf,:account_number_02,:account_number_22,:round_off,:restrict_employer_share,:restrict_employee_share_to_employer_share,:employer_epf,:cutoff, :created_at,:updated_at
  acts_as_audited

  belongs_to :pf_group
  belongs_to :paymonth
  delegate :month_name, :to => :paymonth, :prefix => true

  validates :account_number_21 , :numericality => {:less_than_or_equal_to => 100}

  validates :account_number_22 , :numericality => {:less_than_or_equal_to => 100}

  validates :account_number_02 , :numericality => {:less_than_or_equal_to => 100}

  validates :pension_fund , :numericality => {:less_than_or_equal_to => 100}

  validates :epf , :numericality => {:less_than_or_equal_to => 100}

  def to_date
    next_row = next_row_on_pf_group_id
    (Date.strptime(Paymonth.find(next_row.paymonth_id).month_name, "%b/%Y")-1).strftime("%d-%m-%Y") if next_row
  end

  def next_row_on_pf_group_id
    PfGroupRate.where("pf_group_id = ? AND paymonth_id > ?", self.pf_group_id, self.paymonth_id).order("paymonth_id").first
  end

  def self.pf_rate month_date, pf_grp_id
    pf_rate = PfGroupRate.where("effective_date = '#{month_date.beginning_of_month}' and pf_group_id = ?",pf_grp_id)
    if pf_rate.count > 0
      return_pf_rate = pf_rate
    else
      return_pf_rate = PfGroupRate.where("effective_date = (select MAX(effective_date) from pf_group_rates where pf_group_id = #{pf_grp_id}) and pf_group_id = ?",pf_grp_id)
    end
    return_pf_rate
  end

end
