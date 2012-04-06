class EsiGroupRate < ActiveRecord::Base
  attr_accessible :esi_group_id, :employee_rate, :employer_rate, :cut_off, :minimum_limit_dailywage, :round_off
  acts_as_audited

  belongs_to :esi_group

  validates :employee_rate, :presence => true, :numericality => {:less_than_or_equal_to => 100}

  validates :employer_rate, :presence => true, :numericality => {:less_than_or_equal_to => 100}

  validates :cut_off, :numericality => true

  validates :minimum_limit_dailywage, :numericality => true
end
