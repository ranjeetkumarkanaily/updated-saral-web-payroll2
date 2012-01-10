require 'spec_helper'

describe "pt_groups/show" do
  before(:each) do
    state = FactoryGirl.create(:state)
    @pt_group = assign(:pt_group, stub_model(PtGroup,
      :name => "Name",
      :state => state,
      :certificate_no => "Certificate No",
      :pto_circle_no => "Pto Circle No",
      :address => "Address",
      :return_period => "Return Period"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Certificate No/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Pto Circle No/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Return Period/)
  end
end
