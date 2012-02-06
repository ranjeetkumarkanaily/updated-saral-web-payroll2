require 'spec_helper'

describe "branches/new" do
  before(:each) do
    @pf_group = FactoryGirl.create(:pf_group)
    @pt_group = FactoryGirl.create(:pt_group)
    @esi_group = FactoryGirl.create(:esi_group)

    assign(:branch, stub_model(Branch,
      :branch_name => "MyString",
      :responsible_person => "MyString",
      :address => "MyString",
      :pf_group_id => @pf_group.id,
      :esi_group_id => @esi_group.id,
      :pt_group_id => @pt_group.id
    ).as_new_record)
  end

  it "renders new branch form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => branches_path, :method => "post" do
      assert_select "input#branch_branch_name", :name => "branch[branch_name]"
      assert_select "input#branch_responsible_person", :name => "branch[responsible_person]"
      assert_select "input#branch_address", :name => "branch[address]"
      assert_select "select#branch_pf_group_id", :name => "branch[pf_group_id]"
      assert_select "select#branch_esi_group_id", :name => "branch[esi_group_id]"
      assert_select "select#branch_pt_group_id", :name => "branch[pt_group_id]"
    end
  end
end
