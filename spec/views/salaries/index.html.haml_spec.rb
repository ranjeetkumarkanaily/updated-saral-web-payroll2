require 'spec_helper'


describe "salaries/index.html.haml" do

  it "render form to generate salary" do
    render
    assert_select "form", :action => "/salaries", :method => "post" do
      assert_select "select#month_year", :name => "month_year"
    end
  end

  it "Displays the Calculated salary for the selected employee"  do
    salary = FactoryGirl.create(:salary)
    view.stub!(:params).and_return :employee_id => salary.employee_id
    view.stub!(:params).and_return :month_year => "02/2011"
    assign(:salary_earning,[:head_name => "Basic", :total => 1000])
    puts @salary_earning
    render
    puts rendered

  end


end