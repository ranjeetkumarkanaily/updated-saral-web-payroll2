require 'spec_helper'

describe "PtRates" do
  describe "GET /pt_rates" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get pt_rates_path
      response.status.should be(302)
    end
  end
end
