require 'spec_helper'

describe "holidays/new" do
  before(:each) do
    FactoryGirl.create(:date_format)
    FactoryGirl.create(:option_setting)
    assign(:holiday, stub_model(Holiday,
      :attendance_configuration_id => 1,
      :description => "MyString",
      :national_holiday => false
    ).as_new_record)
  end

  it "renders new holiday form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => holidays_path, :method => "post" do
      assert_select "select#holiday_attendance_configuration_id", :name => "holiday[attendance_configuration_id]"
      assert_select "input#holiday_description", :name => "holiday[description]"
      assert_select "input#holiday_national_holiday", :name => "holiday[national_holiday]"
    end
  end
end
