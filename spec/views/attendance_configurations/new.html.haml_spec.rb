require 'spec_helper'

describe "attendance_configurations/new" do
  before(:each) do
    assign(:attendance_configuration, stub_model(AttendanceConfiguration,
      :attendance => "MyString",
      :short_name => "MyString",
      :salary_calendar_days => 1
    ).as_new_record)
  end

  it "renders new attendance_configuration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => attendance_configurations_path, :method => "post" do
      assert_select "input#attendance_configuration_attendance", :name => "attendance_configuration[attendance]"
      assert_select "input#attendance_configuration_short_name", :name => "attendance_configuration[short_name]"
      assert_select "input#attendance_configuration_salary_calendar_days_actual_days__month", :name => "attendance_configuration[salary_calendar_days]"
    end
  end
end
