require 'spec_helper'

describe "OptionSettings" do
  describe "GET /option_settings" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get option_settings_path
      response.status.should be(302)
    end
  end
end
