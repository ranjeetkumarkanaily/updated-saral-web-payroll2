require 'spec_helper'

describe "pt_group_rates/index" do
  before(:each) do
    pt_group = FactoryGirl.create(:pt_group)
    paymonth1 = FactoryGirl.create(:paymonth)
    paymonth2 = FactoryGirl.create(:paymonth, :month_year => 24133, :month_name => 'Jan/2012')
    assign(:pt_group_rates, [
      stub_model(PtGroupRate,
        :pt_group => pt_group,
        :paymonth => paymonth1
      ),
      stub_model(PtGroupRate,
        :pt_group => pt_group,
        :paymonth => paymonth2
      )
    ])
  end

  #it "renders a list of pt_group_rates" do
  #  render
  #
  #  puts rendered
  #  # Run the generator again with the --webrat flag if you want to use webrat matchers
  #  #assert_select "tr>td", :text => nil.to_s, :count => 2
  #  # Run the generator again with the --webrat flag if you want to use webrat matchers
  #  #assert_select "tr>td", :text => nil.to_s, :count => 2
  #end
end
