require 'spec_helper'

describe "pt_rates/new" do
  before(:each) do
    assign(:pt_rate, stub_model(PtRate,
      :PtGroup => nil,
      :paymonth => nil,
      :min_sal_range => "9.99",
      :max_sal_range => "9.99",
      :pt => "9.99"
    ).as_new_record)
  end

  it "renders new pt_rate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pt_rates_path, :method => "post" do
      assert_select "select#pt_rate_PtGroup_id", :name => "pt_rate[PtGroup_id]"
      assert_select "select#pt_rate_paymonth_id", :name => "pt_rate[paymonth_id]"
      assert_select "input#pt_rate_min_sal_range", :name => "pt_rate[min_sal_range]"
      assert_select "input#pt_rate_pt", :name => "pt_rate[pt]"
    end
  end
end
