require 'spec_helper'


describe "salaries/new.html.haml" do

  it "render form to generate salary" do
    render
    assert_select "form", :action => "/salaries", :method => "post" do
      assert_select "select#month_year", :name => "month_year"
    end
  end

  #it "renders new salary form" do
  #    salary_editor = Factory(:salary_allotment)
  #    view.stub!(:params).and_return :month_year => '01/2011'
  #    view.stub!(:params).and_return :employee_id => '1'
  #
  #    #assign(:salary_allotment, [stub_model(Salary,
  #    #                            :employee_id => salary_editor.employee_id,
  #    #                            :employee_detail_id => salary_editor.employee_detail_id,
  #    #                            :effective_date => salary_editor.effective_date,
  #    #                            :salary_head_id => salary_editor.salary_head_id,
  #    #                            :salary_amount => salary_editor.salary_allotment)])
  #    #puts @salary_allotment.count
  #    render
  #    #puts rendered
  #    #rendered.should have_selector("form input[@value='#{salary_editor.salary_allotment}']")
  #
  #  end

end