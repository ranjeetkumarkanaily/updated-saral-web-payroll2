require 'spec_helper'

describe "salary_group_details/show" do
  before(:each) do
    @salary_head = SalaryHead.create(:head_name => "test_head", :short_name => "test_short_name", :salary_type => "test_salary_type")
    @salary_group = SalaryGroup.create(:salary_group_name => "test_salary_group", :based_on_gross => false)
    @salary_group_detail = assign(:salary_group_detail, stub_model(SalaryGroupDetail,
      :calc_type => "Calc Type",
      :calculation => "Calculation",
      :based_on => "Based On",
      :salary_group => @salary_group,
      :salary_head => @salary_head
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
