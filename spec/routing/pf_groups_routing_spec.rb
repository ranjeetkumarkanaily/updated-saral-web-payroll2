require "spec_helper"

describe PfGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/pf_groups").should route_to("pf_groups#index")
    end

    it "routes to #new" do
      get("/pf_groups/new").should route_to("pf_groups#new")
    end

    it "routes to #show" do
      get("/pf_groups/1").should route_to("pf_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pf_groups/1/edit").should route_to("pf_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pf_groups").should route_to("pf_groups#create")
    end

    it "routes to #update" do
      put("/pf_groups/1").should route_to("pf_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pf_groups/1").should route_to("pf_groups#destroy", :id => "1")
    end

  end
end
