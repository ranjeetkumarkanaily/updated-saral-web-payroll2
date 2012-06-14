require 'spec_helper'

describe "pt_details/edit" do
  before(:each) do
    FactoryGirl.create(:date_format)
    FactoryGirl.create(:option_setting)
    @branch = FactoryGirl.create(:branch)
    @pt_group = FactoryGirl.create(:pt_group)
    @pt_detail = assign(:pt_detail, stub_model(PtDetail,
                                               :branch => @branch,
                                               :pt_group => @pt_group,
                                               :pt_effective_date => "2011-01-01"
    ))
    assign(:branch, @branch)
  end

  it "renders the edit pt_detail form" do
    render

    assert_select "form", :action => branch_pt_details_path(@branch, @pt_detail), :method => "post" do
      assert_select "input#pt_effective_date", :name => "pt_detail[pt_effective_date]"

    end
  end
end
