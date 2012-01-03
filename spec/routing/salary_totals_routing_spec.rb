require "spec_helper"

describe SalaryTotalsController do
  describe "routing" do

    it "routes to #index" do
      get("/salary_totals").should route_to("salary_totals#index")
    end

    it "routes to #new" do
      get("/salary_totals/new").should route_to("salary_totals#new")
    end

    it "routes to #show" do
      get("/salary_totals/1").should route_to("salary_totals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/salary_totals/1/edit").should route_to("salary_totals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/salary_totals").should route_to("salary_totals#create")
    end

    it "routes to #update" do
      put("/salary_totals/1").should route_to("salary_totals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/salary_totals/1").should route_to("salary_totals#destroy", :id => "1")
    end

  end
end
