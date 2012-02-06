require 'spec_helper'

describe "EsiGroups" do
  describe "GET /esi_groups" do
    it "works! " do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get esi_groups_path
      response.status.should be(302)
    end
  end
end
