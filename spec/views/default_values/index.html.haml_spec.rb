require 'spec_helper'

describe "default_values/index.html.haml" do
  before(:each) do
    assign(:default_values, [
      stub_model(DefaultValue,
        :default_type => "Type",
        :value => "Value",
        :value_id => 1
      ),
      stub_model(DefaultValue,
        :default_type => "Type",
        :value => "Value",
        :value_id => 1
      )
    ])
  end

  it "renders a list of default_values" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
