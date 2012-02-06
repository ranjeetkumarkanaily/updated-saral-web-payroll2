require 'spec_helper'

describe "attendance_configurations/show" do
  before(:each) do
    @attendance_configuration = assign(:attendance_configuration, stub_model(AttendanceConfiguration,
      :attendance => "Attendance",
      :short_name => "Short Name",
      :salary_calendar_days => "Actual Days"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Attendance/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Short Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Actual Days/)
  end
end
