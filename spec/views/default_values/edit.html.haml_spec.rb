require 'spec_helper'

describe "default_values/edit.html.haml" do
  before(:each) do
    @default_value = assign(:default_value, stub_model(DefaultValue,
      :type => "",
      :value => "MyString",
      :value_id => 1
    ))
  end

  it "renders the edit default_value form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => default_values_path(@default_value), :method => "post" do
      assert_select "input#default_value_default_type", :name => "default_value[default_type]"
      assert_select "input#default_value_value", :name => "default_value[value]"
      assert_select "input#default_value_value_id", :name => "default_value[value_id]"
    end
  end
end
