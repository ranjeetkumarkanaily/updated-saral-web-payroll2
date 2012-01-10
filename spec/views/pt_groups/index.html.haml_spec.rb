require 'spec_helper'

describe "pt_groups/index" do

  before(:each) do
    state = FactoryGirl.create(:state)
    assign(:pt_groups, [
      stub_model(PtGroup,
        :name => "Name",
        :state => state,
        :certificate_no => "456987",
        :pto_circle_no => "123456",
        :address => "Address",
        :return_period => "Monthly"
      ),
      stub_model(PtGroup,
        :name => "Name1",
        :state => state,
        :certificate_no => "456789",
        :pto_circle_no => "123456",
        :address => "Address1",
        :return_period => "Monthly"
      )
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of pt_groups" do
    render
    rendered.should have_content('Name')
  end
end
