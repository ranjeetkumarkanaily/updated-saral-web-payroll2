require 'spec_helper'


describe "salaries/index.html.haml" do

  it "render form to generate salary" do
    render
    assert_select "form", :action => "/salaries", :method => "post" do
      assert_select "select#month_year", :name => "month_year"
    end
  end

  describe "Generated Salary" do
    before :each do
      @salary = Factory(:salary)
      view.stub!(:params).and_return :month_year => @salary.month_year
    end

    it 'should show generated salary of employee for assigned month_year' do
      assign(:genSal, [stub_model(Salary,
                                  :employee_id => @salary.employee.id,
                                  :basic => @salary.basic,
                                  :da => @salary.da,
                                  :hra => @salary.hra,
                                  :conveyance => @salary.conveyance,
                                  :allowance => @salary.allowance)])

      render
      rendered.should have_content(@salary.employee.id)
    end

    it "should not show salary for unassigned month_year" do
      assign(:genSal,[])
      render
      rendered.should have_content("No Record Found")
    end
  end
end