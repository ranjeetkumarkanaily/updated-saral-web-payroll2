require 'spec_helper'

describe "salary_groups/edit.html.haml" do
  before(:each) do
    @salary_group = assign(:salary_group, stub_model(SalaryGroup,
      :salary_group_name => "MyString",
      :based_on_gross => false
    ))
  end

  it "renders the edit salary_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => salary_groups_path(@salary_group), :method => "post" do
      assert_select "input#salary_group_salary_group_name", :name => "salary_group[salary_group_name]"
      assert_select "input#salary_group_based_on_gross", :name => "salary_group[based_on_gross]"
    end
  end
end
