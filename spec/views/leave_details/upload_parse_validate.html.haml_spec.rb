require 'spec_helper'

describe "leave_details/upload_parse_validate" do
  it "render contents of excel file" do
    employee = FactoryGirl.create(:employee)
    @leaves = Hash.new
    @leaves["leave_details"] = [stub_model(LeaveDetail,
                         :leave_date => "2011-01-01",
                         :employee => employee
    )]
    @leaves["errors"] = []
    assign(:leaves, @leaves)
    render
    rendered.should have_content(employee.refno)
  end
end