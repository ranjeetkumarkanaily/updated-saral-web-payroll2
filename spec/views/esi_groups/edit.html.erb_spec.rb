require 'spec_helper'

describe "esi_groups/edit" do
  before(:each) do
    @esi_group = assign(:esi_group, stub_model(EsiGroup,
      :esi_group_name => "MyString",
      :address => "MyString",
      :esi_no => "MyString",
      :esi_local_office => "MyString"
    ))
  end

  it "renders the edit esi_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => esi_groups_path(@esi_group), :method => "post" do
      assert_select "input#esi_group_esi_group_name", :name => "esi_group[esi_group_name]"
      assert_select "input#esi_group_address", :name => "esi_group[address]"
      assert_select "input#esi_group_esi_no", :name => "esi_group[esi_no]"
      assert_select "input#esi_group_esi_local_office", :name => "esi_group[esi_local_office]"
    end
  end
end
