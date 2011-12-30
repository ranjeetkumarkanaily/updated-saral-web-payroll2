require "spec_helper"

describe MonthYearsController do
  describe "routing" do

    it "routes to #index" do
      get("/month_years").should route_to("month_years#index")
    end

    it "routes to #new" do
      get("/month_years/new").should route_to("month_years#new")
    end

    it "routes to #show" do
      get("/month_years/1").should route_to("month_years#show", :id => "1")
    end

    it "routes to #edit" do
      get("/month_years/1/edit").should route_to("month_years#edit", :id => "1")
    end

    it "routes to #create" do
      post("/month_years").should route_to("month_years#create")
    end

    it "routes to #update" do
      put("/month_years/1").should route_to("month_years#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/month_years/1").should route_to("month_years#destroy", :id => "1")
    end

  end
end
