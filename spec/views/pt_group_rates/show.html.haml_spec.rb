require 'spec_helper'

describe "pt_group_rates/show" do
  before(:each) do
    @pt_group_rate = assign(:pt_group_rate, stub_model(PtGroupRate,
      :pt_group => nil,
      :paymonth => nil
    ))
  end

  #it "renders attributes in <p>" do
  #  render
  #  # Run the generator again with the --webrat flag if you want to use webrat matchers
  #  rendered.should match(//)
  #  # Run the generator again with the --webrat flag if you want to use webrat matchers
  #  rendered.should match(//)
  #end
end
