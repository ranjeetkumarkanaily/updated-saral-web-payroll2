require "spec_helper"

describe EmployeeDetailsController do
  describe "routing" do

    it "routes to #index" do
      get("/employee_details").should route_to("employee_details#index")
    end

    it "routes to #new" do
      get("/employee_details/new").should route_to("employee_details#new")
    end

    it "routes to #show" do
      get("/employee_details/1").should route_to("employee_details#show", :id => "1")
    end

    it "routes to #edit" do
      get("/employee_details/1/edit").should route_to("employee_details#edit", :id => "1")
    end

    it "routes to #create" do
      post("/employee_details").should route_to("employee_details#create")
    end

    it "routes to #update" do
      put("/employee_details/1").should route_to("employee_details#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/employee_details/1").should route_to("employee_details#destroy", :id => "1")
    end

  end
end
