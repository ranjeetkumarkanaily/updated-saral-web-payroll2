require 'spec_helper'

describe "salary_allotments/edit" do

  it "render form contains salary heads for selected employee" do
    attendance_configuration = FactoryGirl.create(:attendance_configuration)
    branch = FactoryGirl.create(:branch)
    financial_institution = FactoryGirl.create(:financial_institution)
    salary_head = FactoryGirl.create(:salary_head)
    salary_group = FactoryGirl.create(:salary_group)
    salary_group_detail = FactoryGirl.create(:salary_group_detail,:salary_head_id=>salary_head.id,:salary_group_id=>salary_group.id,:calc_type=>"Every Month")
    employee = FactoryGirl.create(:employee)
    employee_details = FactoryGirl.create(:employee_detail,
                                          :employee_id => employee.id,
                                          :salary_group_id=>salary_group.id,
                                          :attendance_configuration_id=>attendance_configuration.id,
                                          :branch_id=>branch.id,
                                          :financial_institution_id=>financial_institution.id)
    salAllot = FactoryGirl.create(:salary_allotment, :employee_id => employee.id, :salary_group_detail_id => salary_group_detail.id,:salary_head_id=>salary_head.id)
    view.stub!(:params).and_return :id => salAllot.employee_id

    assign(:allotSal_earnings, [stub_model(SalaryAllotment,
                                  :employee_id => salAllot.employee_id,
                                  :employee_detail_id => salAllot.employee_detail_id,
                                  :effective_date => salAllot.effective_date,
                                  :salary_head_id => salAllot.salary_head_id,
                                  :salary_group_detail_id => salAllot.salary_group_detail_id,
                                  :salary_allotment => salAllot.salary_allotment)])
    assign(:allotSal_deductions, [stub_model(SalaryAllotment,
                                           :employee_id => salAllot.employee_id,
                                           :employee_detail_id => salAllot.employee_detail_id,
                                           :effective_date => salAllot.effective_date,
                                           :salary_head_id => salAllot.salary_head_id,
                                           :salary_group_detail_id => salAllot.salary_group_detail_id,
                                           :salary_allotment => salAllot.salary_allotment)])

    render
    rendered.should have_content("Basic")
  end



end