require "spec_helper"

describe ClassificationsController do
  describe "routing" do

    it "routes to #index" do
      get("/classifications").should route_to("classifications#index")
    end

    it "routes to #new" do
      get("/classifications/new").should route_to("classifications#new")
    end

    it "routes to #show" do
      get("/classifications/1").should route_to("classifications#show", :id => "1")
    end

    it "routes to #edit" do
      get("/classifications/1/edit").should route_to("classifications#edit", :id => "1")
    end

    it "routes to #create" do
      post("/classifications").should route_to("classifications#create")
    end

    it "routes to #update" do
      put("/classifications/1").should route_to("classifications#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/classifications/1").should route_to("classifications#destroy", :id => "1")
    end

  end
end
