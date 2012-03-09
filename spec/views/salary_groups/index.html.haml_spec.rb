require 'spec_helper'

describe "salary_groups/index" do
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
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of salary_groups" do
    render
    rendered.should have_content('Salary Group Name')
  end
end
