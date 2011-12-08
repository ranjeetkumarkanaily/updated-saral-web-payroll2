require "spec_helper"

describe SalaryGroupDetailsController do
  describe "routing" do

    it "routes to #index" do
      get("/salary_group_details").should route_to("salary_group_details#index")
    end

    it "routes to #new" do
      get("/salary_group_details/new").should route_to("salary_group_details#new")
    end

    it "routes to #show" do
      get("/salary_group_details/1").should route_to("salary_group_details#show", :id => "1")
    end

    it "routes to #edit" do
      get("/salary_group_details/1/edit").should route_to("salary_group_details#edit", :id => "1")
    end

    it "routes to #create" do
      post("/salary_group_details").should route_to("salary_group_details#create")
    end

    it "routes to #update" do
      put("/salary_group_details/1").should route_to("salary_group_details#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/salary_group_details/1").should route_to("salary_group_details#destroy", :id => "1")
    end

  end
end
