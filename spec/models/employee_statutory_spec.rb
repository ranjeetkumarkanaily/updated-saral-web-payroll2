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

end
