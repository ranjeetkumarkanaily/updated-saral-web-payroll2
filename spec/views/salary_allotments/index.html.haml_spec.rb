require 'spec_helper'

describe "salary_allotments/index.html.haml" do

  it "render form to select employee" do
    render
    assert_select "form", :action => "/salary_allotments", :method => "get" do
      assert_select "select#employee_id", :name => "employee_id"
    end
  end

  describe "Generated Salary" do
    it "render form contains salary heads for selected employee" do
      salAllot = FactoryGirl.create(:salary_allotment)
      view.stub!(:params).and_return :employee_id => salAllot.employee_id

      assign(:allotSal, [stub_model(SalaryAllotment,
                                        :employee_id => salAllot.employee_id,
                                        :employee_detail_id => salAllot.employee_detail_id,
                                        :effective_date => salAllot.effective_date,
                                        :salary_head_id => salAllot.salary_head_id,
                                        :salary_allotment => salAllot.salary_allotment)])

      render
      rendered.should have_selector("form input[@value='#{salAllot.salary_allotment}']")

    end
  end

end