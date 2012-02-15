require "spec_helper"

describe FinancialInstitutionsController do
  describe "routing" do

    it "routes to #index" do
      get("/financial_institutions").should route_to("financial_institutions#index")
    end

    it "routes to #new" do
      get("/financial_institutions/new").should route_to("financial_institutions#new")
    end

    it "routes to #show" do
      get("/financial_institutions/1").should route_to("financial_institutions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/financial_institutions/1/edit").should route_to("financial_institutions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/financial_institutions").should route_to("financial_institutions#create")
    end

    it "routes to #update" do
      put("/financial_institutions/1").should route_to("financial_institutions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/financial_institutions/1").should route_to("financial_institutions#destroy", :id => "1")
    end

  end
end
