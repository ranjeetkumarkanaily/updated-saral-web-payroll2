require 'spec_helper'

describe "paymonths/edit" do
  before(:each) do
    @paymonth = assign(:paymonth, stub_model(Paymonth,
                                             :month_year => 24144,
                                             :number_of_days => 31,
                                             :month_name => "Dec/2011"
    ))
  end

  it "renders the edit paymonth form" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => paymonths_path(@paymonth), :method => "post" do
      assert_select "input#paymonth_month_name", :name => "paymonth[month_name]"
    end
  end
end
