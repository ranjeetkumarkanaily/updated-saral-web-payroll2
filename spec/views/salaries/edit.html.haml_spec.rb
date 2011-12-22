require 'spec_helper'

describe "salaries/edit.html.haml" do
  before(:each) do
    salary = Factory(:salary)
    @salary = assign(:salary,
                      [stub_model(Salary,
                                 :employee_id => salary.employee_id,
                                 :employee_detail_id => salary.employee_detail_id,
                                 :effective_date => salary.effective_date,
                                 :salary_head_id => salary.salary_head.id,
                                 :salary_amount => salary.salary_amount)])
  end

  it "renders the edit salary form" do
    render
    assert_select "form", :action => "/salaries", :method => "post" do
      assert_select "input#salary__salary_amount", :name => "salary[][salary_amount]"
    end
  end
end