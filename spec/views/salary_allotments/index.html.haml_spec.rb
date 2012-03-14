require 'spec_helper'

describe "salary_allotments/index" do

  it "render index page" do
    employee = FactoryGirl.create(:employee)
    assign(:need_to_allot_Sal,[stub_model(Employee,
                                          :id => employee.id,
                                          :empname => employee.empname,
                                          :refno => employee.refno,
                                          :date_of_joining => "2011-12-01")
                              ]).stub!(:total_pages).and_return(0)

    assign(:already_allot_Sal,[stub_model(Employee,
                                          :id => employee.id,
                                          :empname => employee.empname,
                                          :refno => employee.refno,
                                          :date_of_joining => "2011-12-01")
                              ]).stub!(:total_pages).and_return(0)

    render
    rendered.should have_content(employee.empname)
  end


end