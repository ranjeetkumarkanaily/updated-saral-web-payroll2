require 'spec_helper'

describe "leave_definitions/show" do
  before(:each) do
    @leave_definition = assign(:leave_definition, stub_model(LeaveDefinition,
      :leave_name => "Leave Name",
      :short_name => "Short Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Leave Name/)
    rendered.should match(/Short Name/)
  end
end
