require 'spec_helper'

describe "leave_takens/edit" do
  before(:each) do
    @leave_taken = assign(:leave_taken, stub_model(LeaveTaken,
      :employee_id => 1,
      :count => "9.99"
    ))
  end

  it "renders the edit leave_taken form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => leave_takens_path(@leave_taken), :method => "post" do
      assert_select "input#leave_taken_count", :name => "leave_taken[count]"
    end
  end
end
