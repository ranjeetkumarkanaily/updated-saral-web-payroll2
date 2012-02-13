require 'spec_helper'

describe "pt_group_rates/new" do
  before(:each) do
    assign(:pt_group_rate, stub_model(PtGroupRate,
      :pt_group => nil,
      :paymonth => nil
    ).as_new_record)
  end

  it "renders new pt_group_rate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pt_group_rates_path, :method => "post" do
      assert_select "select#pt_group_rate_paymonth_id", :name => "pt_group_rate[paymonth_id]"
    end
  end
end
