require 'spec_helper'

describe "salary_heads/index" do
  before(:each) do
    assign(:salary_head_earnings, [
      stub_model(SalaryHead,
        :head_name => "Head Name",
        :short_name => "Short Name",
        :salary_type => "Salary Type"
      )]).stub!(:total_pages).and_return(0)

    assign(:salary_head_deductions, [
        stub_model(SalaryHead,
                   :head_name => "Head Name",
                   :short_name => "Short Name",
                   :salary_type => "Salary Type"
        )]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of salary_heads" do
    render
    rendered.should have_content('Head Name')
  end
end
