require 'spec_helper'

describe "paymonths/new" do
  before(:each) do
    assign(:paymonth, stub_model(Paymonth,
      :month_year => 1,
      :number_of_days => 1,
      :month_name => "MyString"
    ).as_new_record)
  end

  it "renders new paymonth form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => paymonths_path, :method => "post" do
    assert_select "input#paymonth_month_name", :name => "paymonth[month_name]"
    end
  end
end
