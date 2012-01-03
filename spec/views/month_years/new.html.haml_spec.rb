require 'spec_helper'

describe "month_years/new.html.haml" do
  before(:each) do
    assign(:month_year, stub_model(MonthYear,
      :month_year => 1,
      :number_of_days => 1,
      :month_name => "MyString"
    ).as_new_record)
  end

  it "renders new month_year form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => month_years_path, :method => "post" do
      assert_select "input#month_year_month_year", :name => "month_year[month_year]"
      assert_select "input#month_year_number_of_days", :name => "month_year[number_of_days]"
      assert_select "input#month_year_month_name", :name => "month_year[month_name]"
    end
  end
end
