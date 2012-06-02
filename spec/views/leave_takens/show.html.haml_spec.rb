require 'spec_helper'

describe "leave_takens/show" do
  before(:each) do
    @leave_taken = assign(:leave_taken, stub_model(LeaveTaken,
      :employee_id => 1,
      :count => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/9.99/)
  end
end
