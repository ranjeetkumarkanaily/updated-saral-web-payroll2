Given /^option settings defined$/ do
  country=Country.create( :name => "India", :currency => "Indian Rupee")
  OptionSetting.create(:country_id => country.id, :time_zone => "(GMT+05:30) Kolkata", :currency => "Rupee", :recruitment => false, :lv_atdn_mgmt => true, :appraisal => true, :training => false, :help_desk => false, :travel_cummute => false, :pf_applicable => true, :esi_applicable => true, :pt_applicable => true, :multi_state_pt => false, :multi_pt => false, :tds_applicable => false, :multi_branch => false, :multi_hr => false, :salary_calc => "Jan/2012", :allow_brnch_admin => false, :approval_flow => false, :audit_trail => true, :remibursement => false, :bonus_and_exgratia => false, :gratuity => false, :loans_adv => false, :arrears => true, :attdn_intgration => false, :asset_tracker => false)
end

When /^User clicks on the ModuleSelection tab$/ do
  find('#module_selection', :text => 'Module Selection').click
end

When /^User clicks on the General Settings tab$/ do
  find('#general_settings', :text => 'General Settings').click
end

When /^User clicks on the Sub Modules tab$/ do
  find('#sub_modules', :text => 'Sub Modules').click
end

When /^User clicks on the Country Settings tab$/ do
  find('#country_settings', :text => 'Country Settings').click
end
