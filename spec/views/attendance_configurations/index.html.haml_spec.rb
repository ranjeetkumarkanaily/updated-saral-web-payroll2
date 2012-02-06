require 'spec_helper'

describe "attendance_configurations/index" do
  before(:each) do
    assign(:attendance_configurations, [
      stub_model(AttendanceConfiguration,
        :attendance => "Attendance",
        :short_name => "Short Name",
        :salary_calendar_days => 1
      ),
      stub_model(AttendanceConfiguration,
        :attendance => "Attendance",
        :short_name => "Short Name",
        :salary_calendar_days => 1
      )
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of attendance_configurations" do
    render
    rendered.should have_content('Attendance')
  end
end
