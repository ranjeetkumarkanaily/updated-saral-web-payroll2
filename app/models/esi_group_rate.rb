class EsiGroupRate < ActiveRecord::Base
  belongs_to :esi_group

  validates :employee_rate, :presence => true, :numericality => {:less_than_or_equal_to => 100}

  validates :employer_rate, :presence => true, :numericality => {:less_than_or_equal_to => 100}

  validates :cut_off, :numericality => true

  validates :minimum_limit_dailywage, :numericality => true
end
