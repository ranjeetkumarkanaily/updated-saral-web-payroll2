require 'spec_helper'

describe "pt_group_rates/index" do
  before(:each) do
    assign(:pt_group_rates, [
      stub_model(PtGroupRate,
        :pt_group => nil,
        :paymonth => nil
      ),
      stub_model(PtGroupRate,
        :pt_group => nil,
        :paymonth => nil
      )
    ])
  end

  #it "renders a list of pt_group_rates" do
  #  render
  #  # Run the generator again with the --webrat flag if you want to use webrat matchers
  #  assert_select "tr>td", :text => nil.to_s, :count => 2
  #  # Run the generator again with the --webrat flag if you want to use webrat matchers
  #  assert_select "tr>td", :text => nil.to_s, :count => 2
  #end
end
