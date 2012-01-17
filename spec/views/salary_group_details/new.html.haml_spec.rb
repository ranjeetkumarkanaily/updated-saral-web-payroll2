require 'spec_helper'

describe "salary_group_details/new.html.haml" do

  it "renders new salary_group_detail form" do
    salary_group = FactoryGirl.create(:salary_group)
    view.stub!(:params).and_return :param1 => salary_group.id

    assign(:salary_group_detail, stub_model(SalaryGroupDetail,
      :calc_type => "MyString",
      :calculation => "MyString",
      :based_on => "MyString",
      :salary_group_id => nil,
      :salary_head => nil
    ).as_new_record)

    render
    ## Run the generator again with the --webrat flag if you want to use webrat matchers
    #assert_select "form", :action => salary_group_details_path, :method => "post" do
    #  assert_select "select#salary_group_detail_calc_type", :name => "salary_group_detail[calc_type]"
    #  assert_select "textarea#salary_group_detail_calculation", :name => "salary_group_detail[calculation]"
    #  assert_select "select#salary_group_detail_based_on", :name => "salary_group_detail[based_on]"
    #  assert_select "select#salary_group_detail_salary_head_id", :name => "salary_group_detail[salary_head]"
    #end
  end
end
