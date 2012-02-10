require 'spec_helper'

describe "pf_group_rates/show" do
  before(:each) do
    @paymonth = FactoryGirl.create(:paymonth)
    @pf_group_rate = assign(:pf_group_rate, stub_model(PfGroupRate,
      :pf_group_id => 1,
      :paymonth_id => @paymonth.id,
      :account_number_21 => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
  end
end
