require "spec_helper"

describe PtGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/pt_groups").should route_to("pt_groups#index")
    end

    it "routes to #new" do
      get("/pt_groups/new").should route_to("pt_groups#new")
    end

    it "routes to #show" do
      get("/pt_groups/1").should route_to("pt_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pt_groups/1/edit").should route_to("pt_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pt_groups").should route_to("pt_groups#create")
    end

    it "routes to #update" do
      put("/pt_groups/1").should route_to("pt_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pt_groups/1").should route_to("pt_groups#destroy", :id => "1")
    end

  end
end
