require 'spec_helper'

describe "branches/show" do
  before(:each) do
    @pf_group = FactoryGirl.create(:pf_group)
    @pt_group = FactoryGirl.create(:pt_group)
    @esi_group = FactoryGirl.create(:esi_group)

    @branch = assign(:branch, stub_model(Branch,
      :branch_name => "Branch Name",
      :responsible_person => "Responsible Person",
      :address => "Address",
      :esi_applicable => true,
      :pf_group_id => @pf_group.id,
      :esi_group_id => @esi_group.id,
      :pt_group_id => @pt_group.id
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Branch Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Responsible Person/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    #rendered.should match(/Kar/)
    ## Run the generator again with the --webrat flag if you want to use webrat matchers
    #rendered.should match(/Karnataka/)
    ## Run the generator again with the --webrat flag if you want to use webrat matchers
    #rendered.should match(/Group/)
  end
end
