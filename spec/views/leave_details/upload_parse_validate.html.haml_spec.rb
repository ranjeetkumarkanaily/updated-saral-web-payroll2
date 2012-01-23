require 'spec_helper'

describe "leave_details/upload_parse_validate.html.haml" do
  it "render contents of excel file" do
    employee = FactoryGirl.create(:employee)
    assign(:leaves,[
      stub_model(LeaveDetail,
        :leave_date => "2011-01-01",
        :employee => employee
      )])
    assign(:errors, [])
    render
    rendered.should have_content(employee.refno)
  end
end