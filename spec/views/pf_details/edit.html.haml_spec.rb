require 'spec_helper'

describe "pf_details/edit" do
  before(:each) do
    @branch = FactoryGirl.create(:branch)
    @pf_group = FactoryGirl.create(:pf_group)
    @pf_detail = assign(:pf_detail, stub_model(PfDetail,
                                                 :branch => @branch,
                                                 :pf_group => @pf_group,
                                                 :pf_effective_date => "2011-01-01"
    ))
    assign(:branch, @branch)
  end

  it "renders the edit pf_detail form" do
    render

    assert_select "form", :action => branch_pf_details_path(@branch, @pf_detail), :method => "post" do
      assert_select "input#pf_effective_date", :name => "pf_detail[pf_effective_date]"

    end
  end
end
