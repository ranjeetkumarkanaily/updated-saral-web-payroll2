require 'spec_helper'

describe "salary_groups/index.html.haml" do
  before(:each) do
    assign(:salary_groups, [
      stub_model(SalaryGroup,
        :salary_group_name => "Salary Group Name",
        :based_on_gross => false
      ),
      stub_model(SalaryGroup,
        :salary_group_name => "Salary Group Name",
        :based_on_gross => false
      )
    ])
  end

  it "renders a list of salary_groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Salary Group Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
