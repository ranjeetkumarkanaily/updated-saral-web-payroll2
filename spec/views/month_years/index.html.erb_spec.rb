require 'spec_helper'

describe "month_years/index.html.haml" do
  before(:each) do
    assign(:month_years, [
      stub_model(MonthYear,
        :month_year => 1,
        :number_of_days => 1,
        :month_name => "Month Name"
      ),
      stub_model(MonthYear,
        :month_year => 1,
        :number_of_days => 1,
        :month_name => "Month Name"
      )
    ])
  end

  it "renders a list of month_years" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Month Name".to_s, :count => 2
  end
end
