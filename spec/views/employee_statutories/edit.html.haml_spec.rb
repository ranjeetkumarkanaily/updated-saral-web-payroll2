require 'spec_helper'

describe "employee_statutories/edit" do
  before(:each) do
    @employee = FactoryGirl.create(:employee)
    @employee_id = @employee.id

    @employee_statutory = assign(:employee_statutory, stub_model(EmployeeStatutory,
      :employee => @employee,
      :pan => "MyString",
      :pf_number => "MyString",
      :esi => "MyString"
    ))
  end

  it "renders the edit employee_statutory form" do

    render
   # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => employee_statutories_path(@employee_statutory), :method => "post" do
      assert_select "input#employee_statutory_pan", :name => "employee_statutory[pan]"
      assert_select "input#employee_statutory_pf_number", :name => "employee_statutory[pf_number]"
      assert_select "input#employee_statutory_esi_number", :name => "employee_statutory[esi_number]"
    end
  end
end
