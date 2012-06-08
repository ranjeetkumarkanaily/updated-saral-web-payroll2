require 'spec_helper'

describe "salaries/edit" do

  it "renders the edit salary form" do
    employee = FactoryGirl.create(:employee)
    salary_head = FactoryGirl.create(:salary_head)
    salary_group = FactoryGirl.create(:salary_group)
    salary_group_detail = FactoryGirl.create(:salary_group_detail, :salary_group_id => salary_group.id, :salary_head_id => salary_head.id)
    attendance_configuration = FactoryGirl.create(:attendance_configuration)
    financial_institution = FactoryGirl.create(:financial_institution)
    branch = FactoryGirl.create(:branch)
    employee_details = FactoryGirl.create(:employee_detail,:employee_id => employee.id, :salary_group_id => salary_group.id,:attendance_configuration_id => attendance_configuration.id, :financial_institution_id => financial_institution.id, :branch_id => branch.id)
    salary = FactoryGirl.create(:salary,:employee_id => employee.id, :salary_head_id => salary_head.id, :salary_group_detail_id => salary_group_detail.id)
    @salary = assign(:salary,
                     [stub_model(Salary,
                                 :employee_id => salary.employee_id,
                                 :employee_detail_id => salary.employee_detail_id,
                                 :effective_date => salary.effective_date,
                                 :salary_head_id => salary.salary_head.id,
                                 :salary_group_detail_id => salary.salary_group_detail.id,
                                 :salary_amount => salary.salary_amount)])

    view.stub!(:params).and_return :month_year => '02/2011',:employee_id => employee.id

    render
    assert_select "form", :action => "/salaries", :method => "post" do
      assert_select "input#salary__salary_amount", :name => "salary[][salary_amount]"
    end
  end

end