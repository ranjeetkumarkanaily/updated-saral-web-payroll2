require 'spec_helper'

describe "option_settings/edit" do
  before(:each) do
    @option_setting = assign(:option_setting, stub_model(OptionSetting,
      :country => "MyString",
      :time_zone => "MyString",
      :currency => "MyString",
      :recruitment => false,
      :lv_atdn_mgmt => false,
      :appraisal => false,
      :training => false,
      :help_desk => false,
      :travel_cummute => false,
      :pf_applicable => false,
      :esi_applicable => false,
      :pt_applicable => false,
      :multi_state_pt => false,
      :multi_pt => false,
      :tds_applicable => false,
      :multi_branch => false,
      :multi_hr => false,
      :salary_calc => false,
      :allow_brnch_admin => false,
      :approval_flow => false,
      :audit_trail => false,
      :remibursement => false,
      :bonus_and_exgratia => false,
      :gratuity => false,
      :loans_adv => false,
      :arrears => false,
      :attdn_intgration => false,
      :asset_tracker => false
    ))
  end

  #it "renders the edit option_setting form" do
  #  render
  #
  #  # Run the generator again with the --webrat flag if you want to use webrat matchers
  #  assert_select "form", :action => option_settings_path(@option_setting), :method => "post" do
  #    assert_select "input#option_setting_country", :name => "option_setting[country]"
  #    assert_select "input#option_setting_time_zone", :name => "option_setting[time_zone]"
  #  end
  #end
end
