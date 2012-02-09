require 'spec_helper'

describe "branches/index" do
  before(:each) do
    @pf_group = FactoryGirl.create(:pf_group)
    @pt_group = FactoryGirl.create(:pt_group)
    @esi_group = FactoryGirl.create(:esi_group)

    assign(:branches, [
      stub_model(Branch,
        :branch_name => "Branch Name",
        :responsible_person => "Responsible Person",
        :address => "Address",
        :pf_group_id => @pf_group.id,
        :esi_applicable => true,
        :esi_group_id => @esi_group.id,
        :pt_group_id => @pt_group.id
      ),
      stub_model(Branch,
        :branch_name => "Branch Name",
        :responsible_person => "Responsible Person",
        :address => "Address",
        :pf_group_id => @pf_group.id,
        :esi_applicable => true,
        :esi_group_id => @esi_group.id,
        :pt_group_id => @pt_group.id
      )
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of branches" do
    render
    rendered.should have_content('Branch Name')
  end
end
