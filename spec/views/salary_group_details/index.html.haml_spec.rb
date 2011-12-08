require 'spec_helper'

describe "salary_group_details/index.html.haml" do
  before(:each) do
    SalaryHead.create(:head_name => "test_head", :short_name => "test_short_name", :salary_type => "test_salary_type")
    SalaryGroup.create(:salary_group_name => "test_salary_group", :based_on_gross => false)
    assign(:salary_group_details, [
      stub_model(SalaryGroupDetail,
        :calc_type => "Calc Type",
        :calculation => "Calculation",
        :based_on => "Based On",
        :salary_group => SalaryGroup.first,
        :salary_head => SalaryHead.first
      ),
      stub_model(SalaryGroupDetail,
        :calc_type => "Calc Type",
        :calculation => "Calculation",
        :based_on => "Based On",
        :salary_group => SalaryGroup.first,
        :salary_head => SalaryHead.first
      )
    ])

  end

  it "renders a list of salary_group_details" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Calc Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Calculation".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Based On".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "test_salary_group".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "test_head".to_s, :count => 2
  end
end
