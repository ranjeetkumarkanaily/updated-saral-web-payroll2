class PfGroupRate < ActiveRecord::Base
  belongs_to :pf_group
  belongs_to :paymonth

  validates :account_number_21 , :numericality => {:less_than_or_equal_to => 100}

  validates :account_number_22 , :numericality => {:less_than_or_equal_to => 100}

  validates :account_number_02 , :numericality => {:less_than_or_equal_to => 100}

  validates :pension_fund , :numericality => {:less_than_or_equal_to => 100}

  validates :epf , :numericality => {:less_than_or_equal_to => 100}
end
