require 'spec_helper'

describe "pt_group_rates/show" do
  before(:each) do
    pt_group = FactoryGirl.create(:pt_group)
    paymonth1 = FactoryGirl.create(:paymonth)
    @pt_group_rate = assign(:pt_group_rate, stub_model(PtGroupRate,
      :pt_group => pt_group,
      :paymonth => paymonth1
    ))
  end



  #paymonth2 = FactoryGirl.create(:paymonth, :month_year => 24133, :month_name => 'Jan/2012')
  #assign(:pt_group_rates, [
  #    stub_model(PtGroupRate,
  #               :pt_group => pt_group,
  #               :paymonth => paymonth1
  #    ),
  #    stub_model(PtGroupRate,
  #               :pt_group => pt_group,
  #               :paymonth => paymonth2
  #    )
  #])
  #it "renders attributes in <p>" do
  #  render
  #
  #  puts rendered
  #  # Run the generator again with the --webrat flag if you want to use webrat matchers
  #  #rendered.should match(//)
  #  # Run the generator again with the --webrat flag if you want to use webrat matchers
  #  #rendered.should match(//)
  #end
end
