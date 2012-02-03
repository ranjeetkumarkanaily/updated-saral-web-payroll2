require 'spec_helper'

describe "holidays/show" do
  before(:each) do
    @attendance_configuration = FactoryGirl.create(:attendance_configuration)
    @holiday = assign(:holiday, stub_model(Holiday,
      :attendance_configuration => @attendance_configuration,
      :description => "Description",
      :national_holiday => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Karnataka/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
