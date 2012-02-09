require 'spec_helper'

describe "pt_rates/index" do
  before(:each) do
    ptGroup = FactoryGirl.create(:pt_group, :name => "PT Group 10")
    monthYear = FactoryGirl.create(:paymonth)
    assign(:pt_rates, [
    stub_model(PtRate,
      :pt_group => ptGroup,
      :paymonth => monthYear,
      :min_sal_range => "9.99",
      :max_sal_range => "9.99",
        :pt => "9.99"
      ),
      stub_model(PtRate,
        :pt_group => ptGroup,
        :paymonth => monthYear,
        :min_sal_range => "9.99",
        :max_sal_range => "9.99",
        :pt => "9.99"
      )
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of pt_rates" do
    render
    rendered.should have_content('Group')
  end
end
