require "spec_helper"

describe PtRatesController do
  describe "routing" do

    it "routes to #index" do
      get("/pt_rates").should route_to("pt_rates#index")
    end

    it "routes to #new" do
      get("/pt_rates/new").should route_to("pt_rates#new")
    end

    it "routes to #show" do
      get("/pt_rates/1").should route_to("pt_rates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pt_rates/1/edit").should route_to("pt_rates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pt_rates").should route_to("pt_rates#create")
    end

    it "routes to #update" do
      put("/pt_rates/1").should route_to("pt_rates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pt_rates/1").should route_to("pt_rates#destroy", :id => "1")
    end

  end
end
