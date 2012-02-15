require 'spec_helper'

describe "FinancialInstitutions" do
  describe "GET /financial_institutions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get financial_institutions_path
      response.status.should be(302)
    end
  end
end
