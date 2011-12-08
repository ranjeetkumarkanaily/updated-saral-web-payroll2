require "spec_helper"

describe SalaryHeadsController do
  describe "routing" do

    it "routes to #index" do
      get("/salary_heads").should route_to("salary_heads#index")
    end

    it "routes to #new" do
      get("/salary_heads/new").should route_to("salary_heads#new")
    end

    it "routes to #show" do
      get("/salary_heads/1").should route_to("salary_heads#show", :id => "1")
    end

    it "routes to #edit" do
      get("/salary_heads/1/edit").should route_to("salary_heads#edit", :id => "1")
    end

    it "routes to #create" do
      post("/salary_heads").should route_to("salary_heads#create")
    end

    it "routes to #update" do
      put("/salary_heads/1").should route_to("salary_heads#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/salary_heads/1").should route_to("salary_heads#destroy", :id => "1")
    end

  end
end
