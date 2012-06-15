require 'spec_helper'

describe "esi_group_rates/index" do
  before(:each) do
    @esi_group = FactoryGirl.create(:esi_group)
    @paymonth = FactoryGirl.create(:paymonth)
    assign(:param_esi_group_id,@esi_group.id)
    assign(:esi_group_rates, [
      stub_model(EsiGroupRate,
        :paymonth_id => @paymonth.id,
        :esi_group_id => 1,
        :employee_rate => 1.5,
        :employer_rate => 1.5,
        :cut_off => 1.5,
        :minimum_limit_dailywage => 1.5,
        :round_off => "Round Off"
      ),
      stub_model(EsiGroupRate,
        :paymonth_id => @paymonth.id,
        :esi_group_id => 1,
        :employee_rate => 1.5,
        :employer_rate => 1.5,
        :cut_off => 1.5,
        :minimum_limit_dailywage => 1.5,
        :round_off => "Round Off"
      )
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of esi_group_rates" do
    render
    rendered.should have_content('1')
  end
end
