require "spec_helper"

describe SalaryGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/salary_groups").should route_to("salary_groups#index")
    end

    it "routes to #new" do
      get("/salary_groups/new").should route_to("salary_groups#new")
    end

    it "routes to #show" do
      get("/salary_groups/1").should route_to("salary_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/salary_groups/1/edit").should route_to("salary_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/salary_groups").should route_to("salary_groups#create")
    end

    it "routes to #update" do
      put("/salary_groups/1").should route_to("salary_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/salary_groups/1").should route_to("salary_groups#destroy", :id => "1")
    end

  end
end
