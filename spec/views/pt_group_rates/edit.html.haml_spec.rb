require 'spec_helper'

describe "pt_group_rates/edit" do
  before(:each) do
    @pt_group_rate = assign(:pt_group_rate, stub_model(PtGroupRate,
      :pt_group => nil,
      :paymonth => nil
    ))
  end

  #it "renders the edit pt_group_rate form" do
  #  render
  #
  #  # Run the generator again with the --webrat flag if you want to use webrat matchers
  #  assert_select "form", :action => pt_group_rates_path(@pt_group_rate), :method => "post" do
  #    assert_select "input#pt_group_rate_pt_group", :name => "pt_group_rate[pt_group]"
  #    assert_select "input#pt_group_rate_paymonth", :name => "pt_group_rate[paymonth]"
  #  end
  #end
end
