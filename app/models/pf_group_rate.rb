class PfGroupRate < ActiveRecord::Base
  belongs_to :pf_group
  belongs_to :paymonth

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

end
