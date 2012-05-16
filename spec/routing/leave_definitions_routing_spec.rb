require "spec_helper"

describe LeaveDefinitionsController do
  describe "routing" do

    it "routes to #index" do
      get("/leave_definitions").should route_to("leave_definitions#index")
    end

    it "routes to #new" do
      get("/leave_definitions/new").should route_to("leave_definitions#new")
    end

    it "routes to #show" do
      get("/leave_definitions/1").should route_to("leave_definitions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/leave_definitions/1/edit").should route_to("leave_definitions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/leave_definitions").should route_to("leave_definitions#create")
    end

    it "routes to #update" do
      put("/leave_definitions/1").should route_to("leave_definitions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/leave_definitions/1").should route_to("leave_definitions#destroy", :id => "1")
    end

  end
end
