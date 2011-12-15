require "spec_helper"

describe DefaultValuesController do
  describe "routing" do

    it "routes to #index" do
      get("/default_values").should route_to("default_values#index")
    end

    it "routes to #new" do
      get("/default_values/new").should route_to("default_values#new")
    end

    it "routes to #show" do
      get("/default_values/1").should route_to("default_values#show", :id => "1")
    end

    it "routes to #edit" do
      get("/default_values/1/edit").should route_to("default_values#edit", :id => "1")
    end

    it "routes to #create" do
      post("/default_values").should route_to("default_values#create")
    end

    it "routes to #update" do
      put("/default_values/1").should route_to("default_values#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/default_values/1").should route_to("default_values#destroy", :id => "1")
    end

  end
end
