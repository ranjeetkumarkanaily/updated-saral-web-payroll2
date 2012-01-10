require 'spec_helper'

describe "pt_groups/edit" do

  before(:each) do
    state = FactoryGirl.create(:state)
    @pt_group = assign(:pt_group, stub_model(PtGroup,
      :name => "MyString",
      :state => state,
      :certificate_no => "MyString",
      :pto_circle_no => "MyString",
      :address => "MyString",
      :return_period => "MyString"
    ))
  end

  it "renders the edit pt_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pt_groups_path(@pt_group), :method => "post" do
      assert_select "input#pt_group_name", :name => "pt_group[name]"
      assert_select "input#pt_group_certificate_no", :name => "pt_group[certificate_no]"
      assert_select "input#pt_group_pto_circle_no", :name => "pt_group[pto_circle_no]"
      assert_select "input#pt_group_address", :name => "pt_group[address]"
    end
  end
end
