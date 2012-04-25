require 'spec_helper'

describe "pf_details/new" do
  before(:each) do
    @branch = FactoryGirl.create(:branch)
    @pf_group = FactoryGirl.create(:pf_group)

    assign(:branch, @branch)
    assign(:pf_details, [FactoryGirl.create(:pf_detail, :branch_id => @branch.id, :pf_group_id => @pf_group.id)])
    assign(:pf_detail, @branch.pf_details.build)
  end


  it "renders new pf_detail form" do
    render

    assert_select "form", :action => branch_pf_details_path(@branch), :method => "post" do
      assert_select "input#pf_effective_date", :name => "pf_detail[pf_effective_date]"
    end
  end
end
