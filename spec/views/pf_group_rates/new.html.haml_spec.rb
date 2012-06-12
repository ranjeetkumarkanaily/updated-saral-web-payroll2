require 'spec_helper'

describe "pf_group_rates/new" do
  before(:each) do
    @pf_group = FactoryGirl.create(:pf_group)
    @paymonth = FactoryGirl.create(:paymonth)
    assign(:param_pf_group_id,@pf_group.id)
    assign(:pf_group_rate, stub_model(PfGroupRate,
      :pf_group_id => 1,
      :paymonth_id => @paymonth.id,
      :account_number_21 => 1.5
    ).as_new_record)
  end

  xit "renders new pf_group_rate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pf_group_rates_path, :method => "post" do
      assert_select "input#pf_group_rate_pf_group_id", :name => "pf_group_rate[pf_group_id]"
      assert_select "select#pf_group_rate_paymonth_id", :name => "pf_group_rate[paymonth_id]"
      assert_select "input#pf_group_rate_account_number_21", :name => "pf_group_rate[account_number_21]"
    end
  end
end
