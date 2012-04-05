require "spec_helper"

describe PtGroupRatesController do
  describe "routing" do

    it "routes to #new" do
      get("/pt_group_rates/new").should route_to("pt_group_rates#new")
    end

    it "routes to #create" do
      post("/pt_group_rates").should route_to("pt_group_rates#create")
    end

  end
end
