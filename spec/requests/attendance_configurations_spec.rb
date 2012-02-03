require 'spec_helper'

describe "AttendanceConfigurations" do
  describe "GET /attendance_configurations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get attendance_configurations_path
      response.status.should be(302)
    end
  end
end
