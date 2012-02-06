class PfGroupRate < ActiveRecord::Base
  belongs_to :pf_group
  belongs_to :paymonth

  validates :account_number_21 , :numericality => {:less_than_or_equal_to => 100}
end
