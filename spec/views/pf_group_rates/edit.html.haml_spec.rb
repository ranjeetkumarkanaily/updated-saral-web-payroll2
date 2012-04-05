require 'spec_helper'

describe "pf_group_rates/edit" do
  before(:each) do
    paymonth = FactoryGirl.create(:paymonth)

    @pf_group_rate = assign(:pf_group_rate, stub_model(PfGroupRate,
      :pf_group_id => 1,
      :paymonth_id => paymonth.id,
      :account_number_21 => 1.5
    ))
    @month_name = assign(:month_name, paymonth.month_name)
  end

  it "renders the edit pf_group_rate form" do
      render
      assert_select "form", :action => pf_group_rates_path(@pf_group_rate), :method => "post" do
      assert_select "input#pf_group_rate_pf_group_id", :name => "pf_group_rate[pf_group_id]"
      rendered.should match(/2010/)
      assert_select "input#pf_group_rate_account_number_21", :name => "pf_group_rate[account_number_21]"
    end
  end
end
