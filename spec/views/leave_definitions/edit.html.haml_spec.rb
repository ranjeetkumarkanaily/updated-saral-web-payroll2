require 'spec_helper'

describe "leave_definitions/edit" do
  before(:each) do
    @leave_definition = assign(:leave_definition, stub_model(LeaveDefinition,
      :leave_name => "MyString",
      :short_name => "MyString"
    ))
  end

  it "renders the edit leave_definition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => leave_definitions_path(@leave_definition), :method => "post" do
      assert_select "input#leave_definition_leave_name", :name => "leave_definition[leave_name]"
      assert_select "input#leave_definition_short_name", :name => "leave_definition[short_name]"
    end
  end
end
