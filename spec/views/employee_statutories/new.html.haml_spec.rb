require 'spec_helper'

describe "employee_statutories/new" do
  before(:each) do
    @employee = FactoryGirl.create(:employee)
    @employee_id = @employee.id
    assign(:employee_statutory, stub_model(EmployeeStatutory,
      :employee => @employee,
      :pan => "MyString",
      :pf_number => "MyString",
      :esi => "MyString"
    ).as_new_record)
  end

  it "renders new employee_statutory form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => employee_statutories_path, :method => "post" do
      assert_select "input#employee_statutory_pan", :name => "employee_statutory[pan]"
      assert_select "input#employee_statutory_pf_number", :name => "employee_statutory[pf_number]"
      assert_select "input#employee_statutory_esi_number", :name => "employee_statutory[esi_number]"
    end
  end
end
