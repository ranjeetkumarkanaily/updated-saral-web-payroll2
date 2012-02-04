require "spec_helper"

describe PfGroupRatesController do
  describe "routing" do

    it "routes to #index" do
      get("/pf_group_rates").should route_to("pf_group_rates#index")
    end

    it "routes to #new" do
      get("/pf_group_rates/new").should route_to("pf_group_rates#new")
    end

    it "routes to #show" do
      get("/pf_group_rates/1").should route_to("pf_group_rates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pf_group_rates/1/edit").should route_to("pf_group_rates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pf_group_rates").should route_to("pf_group_rates#create")
    end

    it "routes to #update" do
      put("/pf_group_rates/1").should route_to("pf_group_rates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pf_group_rates/1").should route_to("pf_group_rates#destroy", :id => "1")
    end

  end
end
