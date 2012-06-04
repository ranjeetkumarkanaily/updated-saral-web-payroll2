require "spec_helper"

describe LeaveTakensController do
  describe "routing" do

    it "routes to #index" do
      get("/leave_takens").should route_to("leave_takens#index")
    end

    it "routes to #new" do
      get("/leave_takens/new").should route_to("leave_takens#new")
    end

    it "routes to #show" do
      get("/leave_takens/1").should route_to("leave_takens#show", :id => "1")
    end

    it "routes to #edit" do
      get("/leave_takens/1/edit").should route_to("leave_takens#edit", :id => "1")
    end

    it "routes to #create" do
      post("/leave_takens").should route_to("leave_takens#create")
    end

    it "routes to #update" do
      put("/leave_takens/1").should route_to("leave_takens#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/leave_takens/1").should route_to("leave_takens#destroy", :id => "1")
    end

  end
end
