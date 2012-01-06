require 'spec_helper'

describe "salary_group_details/index.html.haml" do
  before(:each) do
    @salary_head = SalaryHead.create(:head_name => "test_head", :short_name => "test_short_name", :salary_type => "test_salary_type")
    @salary_group = SalaryGroup.create(:salary_group_name => "test_salary_group", :based_on_gross => false)
    assign(:salary_group_details, [
      stub_model(SalaryGroupDetail,
        :calc_type => "Calc Type",
        :calculation => "Calculation",
        :based_on => "Based On",
        :salary_group => @salary_group,
        :salary_head => @salary_head
      ),
      stub_model(SalaryGroupDetail,
        :calc_type => "Calc Type",
        :calculation => "Calculation",
        :based_on => "Based On",
        :salary_group => @salary_group,
        :salary_head => @salary_head
      )
    ]).stub!(:total_pages).and_return(0)

  end

  it "renders a list of salary_group_details" do
    render
    rendered.should have_content('Calc Type')
  end
end
