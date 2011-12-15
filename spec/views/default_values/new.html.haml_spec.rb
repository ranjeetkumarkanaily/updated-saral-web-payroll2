require 'spec_helper'

describe "default_values/new.html.haml" do
  before(:each) do
    assign(:default_value, stub_model(DefaultValue,
      :type => "",
      :value => "MyString",
      :value_id => 1
    ).as_new_record)
  end

  it "renders new default_value form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => default_values_path, :method => "post" do
      assert_select "input#default_value_type", :name => "default_value[type]"
      assert_select "input#default_value_value", :name => "default_value[value]"
      assert_select "input#default_value_value_id", :name => "default_value[value_id]"
    end
  end
end
