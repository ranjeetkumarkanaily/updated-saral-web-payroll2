require 'spec_helper'

describe "pt_rates/show" do
  before(:each) do
    ptGroup = FactoryGirl.create(:pt_group, :name=> "Group 12")
    monthYear = FactoryGirl.create(:paymonth, :month_name=>"Jan/2012")
    @pt_rate = assign(:pt_rate, stub_model(PtRate,
    :PtGroup => ptGroup,
      :paymonth => monthYear,
      :min_sal_range => "9.99",
      :max_sal_range => "9.99",
      :pt => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end
