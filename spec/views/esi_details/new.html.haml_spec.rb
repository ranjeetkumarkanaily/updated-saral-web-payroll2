require 'spec_helper'

describe "esi_details/new" do
  before(:each) do
    @branch = FactoryGirl.create(:branch)
    @esi_group = FactoryGirl.create(:esi_group)

    assign(:branch, @branch)
    assign(:esi_details, [FactoryGirl.create(:esi_detail, :branch_id => @branch.id, :esi_group_id => @esi_group.id)])
    assign(:esi_detail, @branch.esi_details.build)
  end

  it "renders new esi_detail form" do
    render
    assert_select "form", :action => branch_esi_details_path(@branch), :method => "post" do
      assert_select "input#esi_effective_date", :name => "esi_detail[esi_effective_date]"
    end
  end
end
