require 'spec_helper'

describe EsiGroupRatesController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
    @esi_group = FactoryGirl.create(:esi_group)
    @paymonth = FactoryGirl.create(:paymonth)
  end

  def valid_attributes
    {
      :paymonth_id => @paymonth.id,
      :esi_group_id => 1,
      :employee_rate => 12,
      :employer_rate => 6,
      :cut_off => 500,
      :minimum_limit_dailywage => 600,
      :round_off => 'Higher Rupee'}
  end
  
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all esi_group_rates as @esi_group_rates" do
      esi_group_rate = EsiGroupRate.create! valid_attributes.merge(:esi_group_id => @esi_group.id)
      get :index, {:params1 => @esi_group.id}, valid_session
      assigns(:esi_group_rates).should eq([esi_group_rate])
    end
  end

  describe "GET new" do
    it "assigns a new esi_group_rate as @esi_group_rate" do
      custom_setting_value = FactoryGirl.create(:custom_setting_value)
      get :new, {:params1 => @esi_group.id}, valid_session
      assigns(:esi_group_rate).should be_a_new(EsiGroupRate)
    end
  end

  describe "GET edit" do
    it "assigns the requested esi_group_rate as @esi_group_rate" do
      esi_group_rate = EsiGroupRate.create! valid_attributes.merge(:esi_group_id => @esi_group.id)
      get :edit, {:id => esi_group_rate.to_param}, valid_session
      assigns(:esi_group_rate).should eq(esi_group_rate)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new EsiGroupRate" do
        expect {
          post :create, {:esi_group_rate => valid_attributes.merge(:esi_group_id => @esi_group.id)}, valid_session
        }.to change(EsiGroupRate, :count).by(1)
      end

      it "assigns a newly created esi_group_rate as @esi_group_rate" do
        post :create, {:esi_group_rate => valid_attributes.merge(:esi_group_id => @esi_group.id)}, valid_session
        assigns(:esi_group_rate).should be_a(EsiGroupRate)
        assigns(:esi_group_rate).should be_persisted
      end

      it "redirects to the created esi_group_rate" do
        post :create, {:esi_group_rate => valid_attributes.merge(:esi_group_id => @esi_group.id)}, valid_session
        response.should redirect_to(esi_group_rates_url(:params1 => @esi_group.id))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved esi_group_rate as @esi_group_rate" do
        # Trigger the behavior that occurs when invalid params are submitted
        EsiGroupRate.any_instance.stub(:save).and_return(false)
        post :create, {:esi_group_rate => {}}, valid_session
        assigns(:esi_group_rate).should be_a_new(EsiGroupRate)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        EsiGroupRate.any_instance.stub(:save).and_return(false)
        post :create, {:esi_group_rate => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested esi_group_rate" do
        esi_group_rate = EsiGroupRate.create! valid_attributes.merge(:esi_group_id => @esi_group.id)
        EsiGroupRate.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => esi_group_rate.to_param, :esi_group_rate => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested esi_group_rate as @esi_group_rate" do
        esi_group_rate = EsiGroupRate.create! valid_attributes.merge(:esi_group_id => @esi_group.id)
        put :update, {:id => esi_group_rate.to_param, :esi_group_rate => valid_attributes.merge(:esi_group_id => @esi_group.id)}, valid_session
        assigns(:esi_group_rate).should eq(esi_group_rate)
      end

      it "redirects to the esi_group_rate" do
        esi_group_rate = EsiGroupRate.create! valid_attributes.merge(:esi_group_id => @esi_group.id)
        put :update, {:id => esi_group_rate.to_param, :esi_group_rate => valid_attributes.merge(:esi_group_id => @esi_group.id)}, valid_session
        response.should redirect_to(esi_group_rates_url(:params1 => @esi_group.id))
      end
    end

    describe "with invalid params" do
      it "assigns the esi_group_rate as @esi_group_rate" do
        esi_group_rate = EsiGroupRate.create! valid_attributes.merge(:esi_group_id => @esi_group.id)
        # Trigger the behavior that occurs when invalid params are submitted
        EsiGroupRate.any_instance.stub(:save).and_return(false)
        put :update, {:id => esi_group_rate.to_param, :esi_group_rate => {}}, valid_session
        assigns(:esi_group_rate).should eq(esi_group_rate)
      end

      it "re-renders the 'edit' template" do
        esi_group_rate = EsiGroupRate.create! valid_attributes.merge(:esi_group_id => @esi_group.id)
        # Trigger the behavior that occurs when invalid params are submitted
        EsiGroupRate.any_instance.stub(:save).and_return(false)
        put :update, {:id => esi_group_rate.to_param, :esi_group_rate => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested esi_group_rate" do
      esi_group_rate = EsiGroupRate.create! valid_attributes.merge(:esi_group_id => @esi_group.id)
      expect {
        delete :destroy, {:id => esi_group_rate.to_param}, valid_session
      }.to change(EsiGroupRate, :count).by(-1)
    end

    it "redirects to the esi_group_rates list" do
      esi_group_rate = EsiGroupRate.create! valid_attributes.merge(:esi_group_id => @esi_group.id)
      delete :destroy, {:id => esi_group_rate.to_param}, valid_session
      response.should redirect_to(esi_group_rates_url(:params1 => @esi_group.id))
    end
  end

end
