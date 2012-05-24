require "spec_helper"

describe LeaveOpeningBalancesController do
  describe "routing" do

    it "routes to #index" do
      get("/leave_opening_balances").should route_to("leave_opening_balances#index")
    end

    it "routes to #new" do
      get("/leave_opening_balances/new").should route_to("leave_opening_balances#new")
    end

    it "routes to #show" do
      get("/leave_opening_balances/1").should route_to("leave_opening_balances#show", :id => "1")
    end

    it "routes to #edit" do
      get("/leave_opening_balances/1/edit").should route_to("leave_opening_balances#edit", :id => "1")
    end

    it "routes to #create" do
      post("/leave_opening_balances").should route_to("leave_opening_balances#create")
    end

    it "routes to #update" do
      put("/leave_opening_balances/1").should route_to("leave_opening_balances#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/leave_opening_balances/1").should route_to("leave_opening_balances#destroy", :id => "1")
    end

  end
end
