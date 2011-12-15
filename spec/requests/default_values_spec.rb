require 'spec_helper'

describe "DefaultValues" do
  describe "GET /default_values" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get default_values_path
      response.status.should be(302)
    end
  end
end
