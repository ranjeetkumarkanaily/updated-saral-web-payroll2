require 'spec_helper'

describe "pt_rates/new" do
  before(:each) do
    @pt_group = FactoryGirl.create(:pt_group)
    @paymonth = FactoryGirl.create(:paymonth)
    @pt_rate = assign(:pt_rate, stub_model(PtRate,
       :pt_group => @pt_group,
       :paymonth => @paymonth,
       :min_sal_range => "9.99",
       :max_sal_range => "9.99",
       :pt => "9.99"
    ).as_new_record)
  end

  it "renders new pt_rate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pt_rates_path, :method => "post" do
      assert_select "input#pt_rate_min_sal_range", :name => "pt_rate[min_sal_range]"
      assert_select "input#pt_rate_pt", :name => "pt_rate[pt]"
    end
  end
end
