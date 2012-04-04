require "spec_helper"

describe PtGroupRatesController do
  describe "routing" do

    it "routes to #index" do
      get("/pt_group_rates").should route_to("pt_group_rates#index")
    end

    it "routes to #new" do
      get("/pt_group_rates/new").should route_to("pt_group_rates#new")
    end

    it "routes to #show" do
      get("/pt_group_rates/1").should route_to("pt_group_rates#show", :id => "1")
    end

    it "routes to #create" do
      post("/pt_group_rates").should route_to("pt_group_rates#create")
    end

    it "routes to #update" do
      put("/pt_group_rates/1").should route_to("pt_group_rates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pt_group_rates/1").should route_to("pt_group_rates#destroy", :id => "1")
    end

  end
end
