require 'spec_helper'

describe "branches/edit" do
  before(:each) do
    @pf_group = FactoryGirl.create(:pf_group)
    @pt_group = FactoryGirl.create(:pt_group)
    @esi_group = FactoryGirl.create(:esi_group)

    @branch = assign(:branch, stub_model(Branch,
      :branch_name => "MyString",
      :responsible_person => "MyString",
      :address => "MyString",
      :pf_group_id => @pf_group.id,
      :esi_applicable => true,
      :esi_group_id => @esi_group.id,
      :pt_group_id => @pt_group.id
    ))
  end

  it "renders the edit branch form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => branches_path(@branch), :method => "post" do
      assert_select "input#branch_branch_name", :name => "branch[branch_name]"
      assert_select "input#branch_responsible_person", :name => "branch[responsible_person]"
      assert_select "input#branch_address", :name => "branch[address]"
      assert_select "input#branch_esi_applicable", :name => "branch[esi_applicable]"
      assert_select "select#branch_pf_group_id", :name => "branch[pf_group_id]"
      assert_select "select#branch_esi_group_id", :name => "branch[esi_group_id]"
      assert_select "select#branch_pt_group_id", :name => "branch[pt_group_id]"
    end
  end
end
