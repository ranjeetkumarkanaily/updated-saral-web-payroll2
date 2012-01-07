require 'spec_helper'

describe PfEsiRatesController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  def valid_attributes
    {
        :paymonth_id => 1,
        :pf_rate => 12.03,
        :pf_cutoff => 1522,
        :esi_employee_rate => 12.03,
        :esi_employer_rate => 6.03,
        :esi_cutoff => 1500
    }
  end

  describe "GET 'index'" do
    it "returns http success" do
      pf_esi_rate = FactoryGirl.create(:pf_esi_rate)
      get :index, :month_year => pf_esi_rate.paymonth.id
      assigns(:pfesirate).should eq(pf_esi_rate)
      response.should be_success
    end
  end

  describe "GET show" do
    it "assigns the requested pf_esi_rate as @pfesirate" do
      pf_esi_rate = FactoryGirl.create(:pf_esi_rate)
      get :show, :id => pf_esi_rate.id
      assigns(:pfesirate).should eq(pf_esi_rate)
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      assigns(:pfesirate).should be_a_new(PfEsiRate)
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      pfesi = FactoryGirl.create(:pf_esi_rate)
      get :edit, :id => pfesi.id
      assigns(:pfesirate).should eq(pfesi)
    end
  end

  describe "POST create" do
    it "creates a new pf esi rate" do
      expect {
        post :create, :pf_esi_rate => valid_attributes
      }.to change(PfEsiRate, :count).by(1)
    end

    it "gives error while creating a new pf esi rate" do
      post :create, :pf_esi_rate => valid_attributes.merge(:paymonth_id => "")
      response.should render_template("new")
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested pf_esi_rate" do
        pf_esi_rate = FactoryGirl.create(:pf_esi_rate)
        PfEsiRate.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => pf_esi_rate.id, :pf_esi_rate => {'these' => 'params'}
      end

      it "assigns the requested employee as @employee" do
        pf_esi_rate = FactoryGirl.create(:pf_esi_rate)
        put :update, :id => pf_esi_rate.id, :pf_esi_rate => valid_attributes
        assigns(:pfesirate).should eq(pf_esi_rate)
      end

    end
  end


end
