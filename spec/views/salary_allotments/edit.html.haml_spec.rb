require 'spec_helper'

describe "salary_allotments/edit" do

  it "render form contains salary heads for selected employee" do
    employee = FactoryGirl.create(:employee)
    salary_head = FactoryGirl.create(:salary_head)
    salary_group_detail = FactoryGirl.create(:salary_group_detail,:salary_head_id=>salary_head.id)
    salAllot = FactoryGirl.create(:salary_allotment, :employee_id => employee.id, :salary_group_detail_id => salary_group_detail.id,:salary_head_id=>salary_head.id)
    view.stub!(:params).and_return :id => salAllot.employee_id

    assign(:allotSal, [stub_model(SalaryAllotment,
                                  :employee_id => salAllot.employee_id,
                                  :employee_detail_id => salAllot.employee_detail_id,
                                  :effective_date => salAllot.effective_date,
                                  :salary_head_id => salAllot.salary_head_id,
                                  :salary_group_detail_id => salAllot.salary_group_detail_id,
                                  :salary_allotment => salAllot.salary_allotment)])

    render
    rendered.should have_selector("form input[@value='#{salAllot.salary_allotment}']")
  end



end