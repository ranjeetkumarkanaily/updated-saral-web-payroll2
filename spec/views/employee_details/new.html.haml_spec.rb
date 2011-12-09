require 'spec_helper'

describe "employee_details/new.html.haml" do
  before(:each) do
    assign(:employee_detail, stub_model(EmployeeDetail,
      :employee_id => 1,
      :salary_group_id => 1,
      :allotted_gross => "9.99"
    ).as_new_record)
  end

  it "renders new employee_detail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => employee_details_path, :method => "post" do
      assert_select "input#employee_detail_employee_id", :name => "employee_detail[employee_id]"
      assert_select "input#employee_detail_salary_group_id", :name => "employee_detail[salary_group_id]"
      assert_select "input#employee_detail_allotted_gross", :name => "employee_detail[allotted_gross]"
    end
  end
end
