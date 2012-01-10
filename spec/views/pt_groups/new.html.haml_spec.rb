require 'spec_helper'

describe "pt_groups/new" do
  before(:each) do
    assign(:pt_group, stub_model(PtGroup,
      :name => "MyString",
      :state => nil,
      :certificate_no => "MyString",
      :pto_circle_no => "MyString",
      :address => "MyString",
      :return_period => "MyString"
    ).as_new_record)
  end

  it "renders new pt_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pt_groups_path, :method => "post" do
      assert_select "input#pt_group_name", :name => "pt_group[name]"
      assert_select "input#pt_group_certificate_no", :name => "pt_group[certificate_no]"
      assert_select "input#pt_group_pto_circle_no", :name => "pt_group[pto_circle_no]"
      assert_select "input#pt_group_address", :name => "pt_group[address]"
    end
  end
end
