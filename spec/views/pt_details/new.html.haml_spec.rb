require 'spec_helper'

describe "pt_details/new" do
  before(:each) do
    FactoryGirl.create(:date_format)
    FactoryGirl.create(:option_setting)
    @branch = FactoryGirl.create(:branch)
    @pt_group = FactoryGirl.create(:pt_group)

    assign(:branch, @branch)
    assign(:pt_details, [FactoryGirl.create(:pt_detail, :branch_id => @branch.id, :pt_group_id => @pt_group.id)])
    assign(:pt_detail, @branch.pt_details.build)
  end


  it "renders new pt_detail form" do
    render

    assert_select "form", :action => branch_pt_details_path(@branch), :method => "post" do
      assert_select "input#pt_effective_date", :name => "pt_detail[pt_effective_date]"
    end
  end
end

