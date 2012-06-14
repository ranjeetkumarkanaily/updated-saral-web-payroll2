require 'spec_helper'

describe "pf_group_rates/index" do
  before(:each) do
    FactoryGirl.create(:date_format)
    FactoryGirl.create(:option_setting)
    @pf_group = FactoryGirl.create(:pf_group)
    @paymonth = FactoryGirl.create(:paymonth)
    assign(:param_pf_group_id,@pf_group.id)
    assign(:pf_group_rates, [
      stub_model(PfGroupRate,
        :pf_group => @pf_group,
        :paymonth => @paymonth,
        :account_number_21 => 1.5
      ),
      stub_model(PfGroupRate,
         :pf_group => @pf_group,
         :paymonth => @paymonth,
        :account_number_21 => 1.5
      )
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of pf_group_rates" do
    render
    rendered.should have_content('1')
  end
end
