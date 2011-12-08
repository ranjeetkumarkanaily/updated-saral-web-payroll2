require 'spec_helper'

describe "salary_groups/show.html.haml" do
  before(:each) do
    @salary_group = assign(:salary_group, stub_model(SalaryGroup,
      :salary_group_name => "Salary Group Name",
      :based_on_gross => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Salary Group Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
