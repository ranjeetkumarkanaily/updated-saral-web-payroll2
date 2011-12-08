require 'spec_helper'

describe "salary_heads/new.html.haml" do
  before(:each) do
    assign(:salary_head, stub_model(SalaryHead,
      :head_name => "MyString",
      :short_name => "MyString",
      :salary_type => "MyString"
    ).as_new_record)
  end

  it "renders new salary_head form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => salary_heads_path, :method => "post" do
      assert_select "input#salary_head_head_name", :name => "salary_head[head_name]"
      assert_select "input#salary_head_short_name", :name => "salary_head[short_name]"
      assert_select "input#salary_head_salary_type", :name => "salary_head[salary_type]"
    end
  end
end
