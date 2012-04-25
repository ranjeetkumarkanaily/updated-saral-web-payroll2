require "spec_helper"

describe EmployeeStatutoriesController do
  describe "routing" do

    it "routes to #new" do
      get("/employee_statutories/new").should route_to("employee_statutories#new")
    end

    it "routes to #edit" do
      get("/employee_statutories/1/edit").should route_to("employee_statutories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/employee_statutories").should route_to("employee_statutories#create")
    end

    it "routes to #update" do
      put("/employee_statutories/1").should route_to("employee_statutories#update", :id => "1")
    end
  end
end
