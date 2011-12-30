require 'spec_helper'

describe "month_years/show.html.erb" do
  before(:each) do
    @month_year = assign(:month_year, stub_model(MonthYear,
      :month_year => 1,
      :number_of_days => 1,
      :month_name => "Month Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Month Name/)
  end
end
