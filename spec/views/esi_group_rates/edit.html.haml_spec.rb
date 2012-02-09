require 'spec_helper'

describe "esi_group_rates/edit" do
  before(:each) do
    @esi_group_rate = assign(:esi_group_rate, stub_model(EsiGroupRate,
      :esi_group_id => 1,
      :employee_rate => 1.5,
      :employer_rate => 1.5,
      :cut_off => 1.5,
      :minimum_limit_dailywage => 1.5,
      :round_off => "MyString"
    ))
  end

  it "renders the edit esi_group_rate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => esi_group_rates_path(@esi_group_rate), :method => "post" do
      assert_select "input#esi_group_rate_employee_rate", :name => "esi_group_rate[employee_rate]"
      assert_select "input#esi_group_rate_employer_rate", :name => "esi_group_rate[employer_rate]"
      assert_select "input#esi_group_rate_cut_off", :name => "esi_group_rate[cut_off]"
      assert_select "input#esi_group_rate_minimum_limit_dailywage", :name => "esi_group_rate[minimum_limit_dailywage]"
      assert_select "select#esi_group_rate_round_off", :name => "esi_group_rate[round_off]"
    end
  end
end
