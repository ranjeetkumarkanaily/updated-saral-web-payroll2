require "spec_helper"

describe OptionSettingsController do
  describe "routing" do

    it "routes to #index" do
      get("/option_settings").should route_to("option_settings#index")
    end

    it "routes to #edit" do
      get("/option_settings/1/edit").should route_to("option_settings#edit", :id => "1")
    end

    it "routes to #update" do
      put("/option_settings/1").should route_to("option_settings#update", :id => "1")
    end

  end
end
