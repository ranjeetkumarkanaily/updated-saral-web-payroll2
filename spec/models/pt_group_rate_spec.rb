require 'spec_helper'

describe PtGroupRate do
  before(:each) do
    @paymonth = FactoryGirl.create(:paymonth)
    @pt_group = FactoryGirl.create(:pt_group)
    @attr = {
        :paymonth_id => @paymonth.id,
        :pt_group_id => @pt_group.id
    }
  end
  it { should belong_to(:pt_group)}

  it "should return to date if record is not the latest" do
    paymonth_second = FactoryGirl.create(:paymonth,:month_name => "Jan/2011")
    pt_group_rate_first = PtGroupRate.create(@attr)
    pt_group_rate_second = PtGroupRate.create(@attr.merge(:pt_group_id => @pt_group.id,:paymonth_id => paymonth_second.id) )

    to_date = pt_group_rate_first.to_date
    to_date.should eq("31-12-2010")
  end

end
