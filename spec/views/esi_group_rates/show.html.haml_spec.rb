require 'spec_helper'

describe "esi_group_rates/show" do
  before(:each) do
    @esi_group_rate = assign(:esi_group_rate, stub_model(EsiGroupRate,
      :esi_group_id => 1,
      :employee_rate => 1.5,
      :employer_rate => 1.5,
      :cut_off => 1.5,
      :minimum_limit_dailywage => 1.5,
      :round_off => "Round Off"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Round Off/)
  end
end
