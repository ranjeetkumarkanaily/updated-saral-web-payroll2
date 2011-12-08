#require 'spec_helper'
#
#describe "employee_details/index.html.haml" do
#  before(:each) do
#    assign(:employee_details, [
#      stub_model(EmployeeDetail,
#        :employee_id => 1,
#        :salary_group_id => 1,
#        :allotted_gross => "9.99"
#      ),
#      stub_model(EmployeeDetail,
#        :employee_id => 1,
#        :salary_group_id => 1,
#        :allotted_gross => "9.99"
#      )
#    ])
#  end
#
#  it "renders a list of employee_details" do
#    render
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    assert_select "tr>td", :text => 1.to_s, :count => 2
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    assert_select "tr>td", :text => 1.to_s, :count => 2
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    assert_select "tr>td", :text => "9.99".to_s, :count => 2
#  end
#end
