require 'spec_helper'

describe "leave_takens/new" do
  before(:each) do
    FactoryGirl.create(:date_format)
    FactoryGirl.create(:option_setting)
    employee = FactoryGirl.create(:employee)
    assign(:leave_taken_employees,[{:employee_id=>employee.id, :refno=>"1003", :empname=>"sana"}])
    assign(:employee_count,1)
    assign(:leave_taken, stub_model(LeaveTaken,
      :employee_id => employee.id,
      :leave_detail_date => 'Jan/2012',
      :leave_count => "9.99"
    ).as_new_record)
  end

  it "renders new leave_taken form" do
    render
    assert_select "form", :action => leave_takens_path, :method => "post" do
      assert_select "select#leave_taken_leave_detail_date", :name => "leave_taken[leave_detail_date]"
    end
  end
end
