require "spec_helper"

describe AttendanceConfigurationsController do
  describe "routing" do

    it "routes to #index" do
      get("/attendance_configurations").should route_to("attendance_configurations#index")
    end

    it "routes to #new" do
      get("/attendance_configurations/new").should route_to("attendance_configurations#new")
    end

    it "routes to #show" do
      get("/attendance_configurations/1").should route_to("attendance_configurations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/attendance_configurations/1/edit").should route_to("attendance_configurations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/attendance_configurations").should route_to("attendance_configurations#create")
    end

    it "routes to #update" do
      put("/attendance_configurations/1").should route_to("attendance_configurations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/attendance_configurations/1").should route_to("attendance_configurations#destroy", :id => "1")
    end

  end
end
