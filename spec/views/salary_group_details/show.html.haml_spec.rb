require 'spec_helper'

describe "salary_group_details/show.html.haml" do
  before(:each) do
    SalaryHead.create(:head_name => "test_head", :short_name => "test_short_name", :salary_type => "test_salary_type")
    SalaryGroup.create(:salary_group_name => "test_salary_group", :based_on_gross => false)
    @salary_group_detail = assign(:salary_group_detail, stub_model(SalaryGroupDetail,
      :calc_type => "Calc Type",
      :calculation => "Calculation",
      :based_on => "Based On",
      :salary_group => SalaryGroup.first,
      :salary_head => SalaryHead.first
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Calc Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Calculation/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Based On/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/test_salary_group/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/test_head/)
  end
end
