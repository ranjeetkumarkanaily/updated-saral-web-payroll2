require 'spec_helper'

describe PfCalculatedValue do

  it { should belong_to(:employee)}

  it "should give PF calculated value" do
    employee = FactoryGirl.create(:employee)
    employee_statutory = FactoryGirl.create(:employee_statutory, :employee_id => employee.id)
    pf_calculated_value = FactoryGirl.create(:pf_calculated_value, :employee_id => employee.id)
    calc_vol_pf_amount = PfCalculatedValue.vol_pf_amount "Feb/2011", employee.id
    calc_vol_pf_amount.should eq(3000.0)
  end

  it "should not give PF calculated value because vol PF is not present" do
    employee = FactoryGirl.create(:employee)
    pf_calculated_value = FactoryGirl.create(:pf_calculated_value, :employee_id => employee.id)
    calc_vol_pf_amount = PfCalculatedValue.calculated_vol_pf_amount "Feb/2011", employee.id
    calc_vol_pf_amount.should eq(0.0)
  end

end