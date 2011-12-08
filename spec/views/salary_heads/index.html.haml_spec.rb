require 'spec_helper'

describe "salary_heads/index.html.haml" do
  before(:each) do
    assign(:salary_heads, [
      stub_model(SalaryHead,
        :head_name => "Head Name",
        :short_name => "Short Name",
        :salary_type => "Salary Type"
      ),
      stub_model(SalaryHead,
        :head_name => "Head Name",
        :short_name => "Short Name",
        :salary_type => "Salary Type"
      )
    ])
  end

  it "renders a list of salary_heads" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Head Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Short Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Salary Type".to_s, :count => 2
  end
end
