require 'spec_helper'

describe "salary_heads/edit.html.haml" do
  before(:each) do
    @salary_head = assign(:salary_head, stub_model(SalaryHead,
      :head_name => "MyString",
      :short_name => "MyString",
      :salary_type => "MyString"
    ))
  end

  it "renders the edit salary_head form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => salary_heads_path(@salary_head), :method => "post" do
      assert_select "input#salary_head_head_name", :name => "salary_head[head_name]"
      assert_select "input#salary_head_short_name", :name => "salary_head[short_name]"
      assert_select "input#salary_head_salary_type", :name => "salary_head[salary_type]"
    end
  end
end
