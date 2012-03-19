require 'spec_helper'


describe "salaries/index" do

  it "render form to generate salary" do
    render
    assert_select "form", :action => "/salaries", :method => "post" do
      assert_select "select#month_year", :name => "month_year"
    end
  end

  describe "Generate Salary" do
    it 'should show generated salary of employee for selected month_year' do
      salary_head = FactoryGirl.create(:salary_head)
      salary_group_detail = FactoryGirl.create(:salary_group_detail, :salary_head_id => salary_head.id)
      salary = FactoryGirl.create(:salary, :salary_head_id => salary_head.id, :salary_group_detail_id => salary_group_detail.id)
      view.stub!(:params).and_return :month_year => '02/2011',:employee_id => salary.employee_id

      assign(:salary_earning, [stub_model(Salary,
                                  :employee_id => salary.employee_id,
                                  :salary_amount => salary.salary_amount,
                                  :employee_detail_id => salary.employee_detail_id,
                                  :salary_head_id => salary.salary_head.id)])

      assign(:salary_deduction, [stub_model(Salary,
                                          :employee_id => salary.employee_id,
                                          :salary_amount => salary.salary_amount,
                                          :employee_detail_id => salary.employee_detail_id,
                                          :salary_head_id => salary.salary_head.id)])

      render
      rendered.should have_content(salary.salary_head.head_name)
    end
  end

end