require 'spec_helper'

describe "SalaryGroups" do
  describe "GET /salary_groups" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get salary_groups_path
      response.status.should be(302)
    end
  end
end
