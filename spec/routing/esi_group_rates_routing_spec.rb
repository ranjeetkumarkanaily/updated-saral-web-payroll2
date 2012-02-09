require "spec_helper"

describe EsiGroupRatesController do
  describe "routing" do

    it "routes to #index" do
      get("/esi_group_rates").should route_to("esi_group_rates#index")
    end

    it "routes to #new" do
      get("/esi_group_rates/new").should route_to("esi_group_rates#new")
    end

    it "routes to #show" do
      get("/esi_group_rates/1").should route_to("esi_group_rates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/esi_group_rates/1/edit").should route_to("esi_group_rates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/esi_group_rates").should route_to("esi_group_rates#create")
    end

    it "routes to #update" do
      put("/esi_group_rates/1").should route_to("esi_group_rates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/esi_group_rates/1").should route_to("esi_group_rates#destroy", :id => "1")
    end

  end
end
