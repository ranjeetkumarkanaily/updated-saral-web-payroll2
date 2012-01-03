require 'spec_helper'

describe SalaryTotalsController do
  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all salary_totals as @salary_totals" do
      salary_total = SalaryTotal.create! valid_attributes
      get :index
      assigns(:salary_totals).should eq([salary_total])
    end
  end
end
