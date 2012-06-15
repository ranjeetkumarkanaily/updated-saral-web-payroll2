require 'spec_helper'

describe "holidays/index" do
  before(:each) do
    FactoryGirl.create(:date_format)
    FactoryGirl.create(:option_setting)
    assign(:holidays, [
      stub_model(Holiday,
        :attendance_configuration_id => 1,
        :description => "Description",
        :national_holiday => true,
        :holiday_date => "2012-01-26"
      ),
      stub_model(Holiday,
        :attendance_configuration_id => 1,
        :description => "Description",
        :national_holiday => true,
        :holiday_date => "2012-10-02"
      )
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of holidays" do
    render
    rendered.should have_content('Description')
  end
end
