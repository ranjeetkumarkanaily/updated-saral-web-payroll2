require 'spec_helper'

describe "leave_definitions/index" do
  before(:each) do
    assign(:leave_definitions, [
      stub_model(LeaveDefinition,
        :leave_name => "Leave Name",
        :short_name => "Short Name"
      )]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of leave_definitions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should have_content('Leave Name')

  end
end
