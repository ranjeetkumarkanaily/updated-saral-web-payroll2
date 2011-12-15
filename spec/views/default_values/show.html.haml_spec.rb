require 'spec_helper'

describe "default_values/show.html.haml" do
  before(:each) do
    @default_value = assign(:default_value, stub_model(DefaultValue,
      :type => "Type",
      :value => "Value",
      :value_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Value/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
