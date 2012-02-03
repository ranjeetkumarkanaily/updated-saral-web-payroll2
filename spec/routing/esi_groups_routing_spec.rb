require "spec_helper"

describe EsiGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/esi_groups").should route_to("esi_groups#index")
    end

    it "routes to #new" do
      get("/esi_groups/new").should route_to("esi_groups#new")
    end

    it "routes to #show" do
      get("/esi_groups/1").should route_to("esi_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/esi_groups/1/edit").should route_to("esi_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/esi_groups").should route_to("esi_groups#create")
    end

    it "routes to #update" do
      put("/esi_groups/1").should route_to("esi_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/esi_groups/1").should route_to("esi_groups#destroy", :id => "1")
    end

  end
end
