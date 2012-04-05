require "spec_helper"

describe PaymonthsController do
  describe "routing" do

    it "routes to #index" do
      get("/paymonths").should route_to("paymonths#index")
    end

    it "routes to #new" do
      get("/paymonths/new").should route_to("paymonths#new")
    end

    it "routes to #show" do
      get("/paymonths/1").should route_to("paymonths#show", :id => "1")
    end

    it "routes to #create" do
      post("/paymonths").should route_to("paymonths#create")
    end

    it "routes to #destroy" do
      delete("/paymonths/1").should route_to("paymonths#destroy", :id => "1")
    end

  end
end
