require 'spec_helper'

describe "option_settings/index" do
  before(:each) do
    @country = FactoryGirl.create(:country)
    assign(:option_setting, [
      stub_model(OptionSetting,
        :country_id => @country.id,
        :time_zone => "Time Zone",
        :currency => @country.currency
      )
    ])
  end

  #it "renders a list of option_setting" do
  #  render
  #  # Run the generator again with the --webrat flag if you want to use webrat matchers
  #  #assert_select "tr>td", :text => "Time Zone".to_s, :count => 1
  #  #assert_select "tr>td", :text => "Currency".to_s, :count => 1
  #  #assert_select "tr>td", :text => false.to_s, :count =>1
  #end
end
