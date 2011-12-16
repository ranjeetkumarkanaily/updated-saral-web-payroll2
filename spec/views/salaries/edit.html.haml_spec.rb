require 'spec_helper'

describe "salaries/edit.html.haml" do
  before(:each) do
    @salary = assign(:salary,
                      [stub_model(Salary,
                                 :employee_id => 1,
                                 :employee_detail_id => 1,
                                 :effective_date => "2011-02-01",
                                 :salary_head_id => 1,
                                 :salary_amount => 1000)])
  end

  it "renders the edit salary form" do
    render
    assert_select "form", :action => "/salaries", :method => "post" do
      assert_select "input#salary__salary_amount", :name => "salary[][salary_amount]"
    end
  end
end