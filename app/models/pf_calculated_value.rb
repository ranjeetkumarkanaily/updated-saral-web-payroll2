class PfCalculatedValue < ActiveRecord::Base
  attr_accessible :pf_earning, :pf_amount, :epf_amount, :eps_amount,:vol_pf_amount,:employee_id,:effective_date
  acts_as_audited

  def self.vol_pf_amount month_year, employee_id
    month_year = Date.strptime month_year, '%b/%Y'
    PfCalculatedValue.select("vol_pf_amount").where("employee_id = #{employee_id} and effective_date = '#{month_year.beginning_of_month}'")[0].vol_pf_amount
  end

end