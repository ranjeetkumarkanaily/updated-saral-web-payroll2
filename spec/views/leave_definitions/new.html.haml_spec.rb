require 'spec_helper'

describe "leave_definitions/new" do
  before(:each) do
    assign(:leave_definition, stub_model(LeaveDefinition,
      :leave_name => "MyString",
      :short_name => "MyString"
    ).as_new_record)
  end

  it "renders new leave_definition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => leave_definitions_path, :method => "post" do
      assert_select "input#leave_definition_leave_name", :name => "leave_definition[leave_name]"
      assert_select "input#leave_definition_short_name", :name => "leave_definition[short_name]"
    end
  end
end
