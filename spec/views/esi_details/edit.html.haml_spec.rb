require 'spec_helper'

describe "esi_details/edit" do
  before(:each) do
    @branch = FactoryGirl.create(:branch)
    @esi_group = FactoryGirl.create(:esi_group)
    @esi_detail = assign(:esi_detail, stub_model(EsiDetail,
      :branch => @branch,
      :esi_group => @esi_group,
      :esi_effective_date => "2011-01-01"
    ))
    assign(:branch, @branch)
  end

  it "renders the edit esi_detail form" do
    render
    assert_select "form", :action => branch_esi_details_path(@branch, @esi_detail), :method => "post" do
      assert_select "input#esi_effective_date", :name => "esi_detail[esi_effective_date]"
    end
  end
end
