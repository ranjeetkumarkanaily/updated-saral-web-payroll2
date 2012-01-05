require 'spec_helper'

describe "Paymonths" do
  describe "GET /paymonths" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get paymonths_path
      response.status.should be(302)
    end
  end
end
