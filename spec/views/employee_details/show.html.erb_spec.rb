require 'spec_helper'

describe "employee_details/show.html.erb" do
  before(:each) do
    @employee_detail = assign(:employee_detail, stub_model(EmployeeDetail,
      :employee_id => 1,
      :salary_group_id => 1,
      :allotted_gross => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end
