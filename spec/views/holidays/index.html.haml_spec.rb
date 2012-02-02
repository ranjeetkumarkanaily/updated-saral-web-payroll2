require 'spec_helper'

describe "holidays/index" do
  before(:each) do
    assign(:holidays, [
      stub_model(Holiday,
        :attendance_configuration_id => 1,
        :description => "Description",
        :national_holiday => false
      ),
      stub_model(Holiday,
        :attendance_configuration_id => 1,
        :description => "Description",
        :national_holiday => false
      )
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of holidays" do
    render
    rendered.should have_content('Description')
  end
end
