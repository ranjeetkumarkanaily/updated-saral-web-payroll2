require 'spec_helper'

describe PfGroupRate do
  it { should belong_to(:pf_group)}

  it "should give PF Rate for selected month" do
    pf_group = FactoryGirl.create(:pf_group)
    paymonth = FactoryGirl.create(:paymonth)
    pf_group_rate = FactoryGirl.create(:pf_group_rate, :pf_group_id => pf_group.id, :paymonth_id => paymonth.id)
    month_date = Date.strptime paymonth.month_name, "%b/%Y"
    pf_rate_val = PfGroupRate.pf_rate month_date, pf_group.id
    pf_rate_val.should eq([pf_group_rate])
  end

  it "should give PF Rate for selected month in which PF Rate is not defined" do
    pf_group = FactoryGirl.create(:pf_group)
    paymonth = FactoryGirl.create(:paymonth)
    pf_group_rate = FactoryGirl.create(:pf_group_rate, :pf_group_id => pf_group.id, :paymonth_id => paymonth.id)
    month_date = Date.strptime "Jan/2011", "%b/%Y"
    pf_rate_val = PfGroupRate.pf_rate month_date, pf_group.id
    pf_rate_val.should eq([pf_group_rate])
  end

end
