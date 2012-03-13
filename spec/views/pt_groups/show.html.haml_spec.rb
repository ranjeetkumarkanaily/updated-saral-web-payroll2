require 'spec_helper'

describe "pt_groups/show" do
  before(:each) do
    state = FactoryGirl.create(:state)
    paymonth = FactoryGirl.create(:paymonth)
    @pt_group = assign(:pt_group, stub_model(PtGroup,
      :name => "Name",
      :state => state,
      :certificate_no => "Certificate No",
      :pto_circle_no => "Pto Circle No",
      :address => "Address",
      :return_period => "Return Period"
    ))

    assign(:pt_group_rates, [stub_model(PtGroupRate,
                                       :pt_group_id => @pt_group.id,
                                       :paymonth_id => paymonth.id
                                       )])
  end

  it "renders attributes in <p>" do
    render

    rendered.should match(/Name/)

  end
end
