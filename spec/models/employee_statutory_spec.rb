require 'spec_helper'

describe EmployeeStatutory do
  before(:each) do
    @employee = FactoryGirl.create(:employee)
    @attr = {
        :employee => @employee,
        :pan => "aaaaa1234a",
        :pan_effective_date => "2012-01-01",
        :pf => "123pf",
        :pf_effective_date => "2012-01-01",
        :esi => "A1234",
        :esi_effective_dat => "2012-01-01",
    }
  end

  it { should belong_to(:employee)}

  it "should give vol. PF amount" do
    employee_statutory = FactoryGirl.create(:employee_statutory, :employee_id => @employee.id)
    vol_pf_amount = EmployeeStatutory.get_vol_pf_amount @employee.id, 10000
    vol_pf_amount.should eq(2000.0)
  end

  it "should give vol. PF amount if vol PF percentage is null" do
    employee_statutory = FactoryGirl.create(:employee_statutory, :employee_id => @employee.id, :vol_pf_percentage => '')
    vol_pf_amount = EmployeeStatutory.get_vol_pf_amount @employee.id, 10000
    vol_pf_amount.should eq(3000.0)
  end

  it "should not give vol. PF amount if vol PF is false" do
    employee_statutory = FactoryGirl.create(:employee_statutory, :employee_id => @employee.id, :vol_pf => false)
    vol_pf_amount = EmployeeStatutory.get_vol_pf_amount @employee.id, 10000
    vol_pf_amount.should eq(0.0)
  end

end
