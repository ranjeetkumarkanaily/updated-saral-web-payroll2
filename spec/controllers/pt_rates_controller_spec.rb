require 'spec_helper'

describe PtRatesController do
  before :each do
    controller.stub(:logged_in?).and_return(true)

  end

  def valid_attributes
    {
        :PtGroup_id => 1,
        :paymonth_id => 1,
        :min_sal_range => 15000,
        :pt => 1500
    }
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PtRatesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all pt_rates as @pt_rates" do
      #FactoryGirl.create(:pt_rate)
      pt_rate = PtRate.create! valid_attributes
      get :index, {}, valid_session
      assigns(:pt_rates).should eq([pt_rate])
    end
  end

  describe "GET show" do
    it "assigns the requested pt_rate as @pt_rate" do
      pt_rate = PtRate.create! valid_attributes
      get :show, {:id => pt_rate.to_param}, valid_session
      assigns(:pt_rate).should eq(pt_rate)

    end
  end

  describe "GET new" do
    it "assigns a new pt_rate as @pt_rate" do
      get :new, {}, valid_session
      assigns(:pt_rate).should be_a_new(PtRate)
    end
  end

  describe "GET edit" do
    it "assigns the requested pt_rate as @pt_rate" do
      pt_rate = PtRate.create! valid_attributes
      get :edit, {:id => pt_rate.to_param}, valid_session
      assigns(:pt_rate).should eq(pt_rate)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PtRate" do
        expect {
          post :create, {:pt_rate => valid_attributes}, valid_session
        }.to change(PtRate, :count).by(1)
      end

      it "assigns a newly created pt_rate as @pt_rate" do
        post :create, {:pt_rate => valid_attributes}, valid_session
        assigns(:pt_rate).should be_a(PtRate)
        assigns(:pt_rate).should be_persisted
      end

      it "redirects to the created pt_rate" do
        post :create, {:pt_rate => valid_attributes}, valid_session
        response.should redirect_to(PtRate.last)
      end

      it "updates the previous max sal range" do
        pt_rate = FactoryGirl.create(:pt_rate)
        pt_rate1 = FactoryGirl.create(:pt_rate, :min_sal_range => 4000, :paymonth_id => pt_rate.paymonth_id)
        PtRate.find(pt_rate.id).max_sal_range.should eq(pt_rate1.min_sal_range - 0.01)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pt_rate as @pt_rate" do
        # Trigger the behavior that occurs when invalid params are submitted
        PtRate.any_instance.stub(:save).and_return(false)
        post :create, {:pt_rate => {}}, valid_session
        assigns(:pt_rate).should be_a_new(PtRate)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PtRate.any_instance.stub(:save).and_return(false)
        post :create, {:pt_rate => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested pt_rate" do
        pt_rate = PtRate.create! valid_attributes
        # Assuming there are no other pt_rates in the database, this
        # specifies that the PtRate created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        PtRate.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => pt_rate.to_param, :pt_rate => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested pt_rate as @pt_rate" do
        pt_rate = PtRate.create! valid_attributes
        put :update, {:id => pt_rate.to_param, :pt_rate => valid_attributes}, valid_session
        assigns(:pt_rate).should eq(pt_rate)
      end

      it "redirects to the pt_rate" do
        pt_rate = PtRate.create! valid_attributes
        put :update, {:id => pt_rate.to_param, :pt_rate => valid_attributes}, valid_session
        response.should redirect_to(pt_rate)
        #response.should be_succes
      end
    end

    describe "with invalid params" do
      it "assigns the pt_rate as @pt_rate" do
        pt_rate = PtRate.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PtRate.any_instance.stub(:save).and_return(false)
        put :update, {:id => pt_rate.to_param, :pt_rate => {}}, valid_session
        assigns(:pt_rate).should eq(pt_rate)
      end

      it "re-renders the 'edit' template" do
        pt_rate = PtRate.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PtRate.any_instance.stub(:save).and_return(false)
        put :update, {:id => pt_rate.to_param, :pt_rate => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end


  describe "DELETE destroy" do
    it "destroys the requested pt_rate" do
      pt_rate = PtRate.create! valid_attributes
      expect {
        delete :destroy, {:id => pt_rate.to_param}, valid_session
      }.to change(PtRate, :count).by(-1)
    end

    it "redirects to the pt_rates list" do
      pt_rate = PtRate.create! valid_attributes
      delete :destroy, {:id => pt_rate.to_param}, valid_session
      response.should redirect_to(pt_rates_url)
    end

    it "destroy the request and updates previous request max sal range to 0" do
      pt_rate = FactoryGirl.create(:pt_rate)
      pt_rate1 = FactoryGirl.build(:pt_rate, :min_sal_range => 4000, :paymonth_id => pt_rate.paymonth_id)
      #puts pt_rate.max_sal_range
      #delete :destroy, {:id => pt_rate1.to_param}, valid_session
      #puts pt_rate.max_sal_range
      #response.should redirect_to(pt_rates_url)

    end
  end

end
