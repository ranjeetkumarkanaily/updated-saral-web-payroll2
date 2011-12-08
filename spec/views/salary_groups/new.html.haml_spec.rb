require 'spec_helper'

describe "salary_groups/new.html.haml" do
  before(:each) do
    assign(:salary_group, stub_model(SalaryGroup,
      :salary_group_name => "MyString",
      :based_on_gross => false
    ).as_new_record)
  end

  it "renders new salary_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => salary_groups_path, :method => "post" do
      assert_select "input#salary_group_salary_group_name", :name => "salary_group[salary_group_name]"
      assert_select "input#salary_group_based_on_gross", :name => "salary_group[based_on_gross]"
    end
  end
end
