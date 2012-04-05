require "spec_helper"

describe ClassificationHeadingsController do
  describe "routing" do

    it "routes to #index" do
      get("/classification_headings").should route_to("classification_headings#index")
    end

    it "routes to #new" do
      get("/classification_headings/new").should route_to("classification_headings#new")
    end

    it "routes to #edit" do
      get("/classification_headings/1/edit").should route_to("classification_headings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/classification_headings").should route_to("classification_headings#create")
    end

    it "routes to #update" do
      put("/classification_headings/1").should route_to("classification_headings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/classification_headings/1").should route_to("classification_headings#destroy", :id => "1")
    end

  end
end
