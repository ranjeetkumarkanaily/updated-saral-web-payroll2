require 'spec_helper'

describe "salary_heads/show.html.haml" do
  before(:each) do
    @salary_head = assign(:salary_head, stub_model(SalaryHead,
      :head_name => "Head Name",
      :short_name => "Short Name",
      :salary_type => "Salary Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Head Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Short Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Salary Type/)
  end
end
