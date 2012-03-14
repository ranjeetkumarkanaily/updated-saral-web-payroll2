require 'spec_helper'


describe PtGroupRatesController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
    @paymonth = FactoryGirl.create(:paymonth)
    @pt_group = FactoryGirl.create(:pt_group)
  end

  # This should return the minimal set of attributes required to create a valid
  # PtGroupRate. As you add validations to PtGroupRate, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      :paymonth_id => @paymonth.id,
      :pt_group_id => @pt_group.id
    }
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PtGroupRatesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all pt_group_rates as @pt_group_rates" do
      pt_group_rate = PtGroupRate.create! valid_attributes
      get :index, {}, valid_session
      assigns(:pt_group_rates).should eq([pt_group_rate])
    end
  end

  describe "GET show" do
    it "assigns the requested pt_group_rate as @pt_group_rate" do
      pt_group_rate = PtGroupRate.create! valid_attributes
      get :show, {:id => pt_group_rate.to_param}, valid_session
      assigns(:pt_group_rate).should eq(pt_group_rate)
    end
  end

  describe "GET new" do
    it "assigns a new pt_group_rate as @pt_group_rate" do
      get :new, {:pt_group_id => valid_attributes[:pt_group_id]}, valid_session
      assigns(:pt_group_rate).should be_a_new(PtGroupRate)

    end
  end

  describe "GET edit" do
    it "assigns the requested pt_group_rate as @pt_group_rate" do
      pt_group_rate = PtGroupRate.create! valid_attributes
      get :edit, {:id => pt_group_rate.to_param}, valid_session
      assigns(:pt_group_rate).should eq(pt_group_rate)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PtGroupRate" do
        expect {
          post :create, {:pt_group_rate => valid_attributes}, valid_session
        }.to change(PtGroupRate, :count).by(1)
      end

      it "assigns a newly created pt_group_rate as @pt_group_rate" do
        post :create, {:pt_group_rate => valid_attributes}, valid_session
        assigns(:pt_group_rate).should be_a(PtGroupRate)
        assigns(:pt_group_rate).should be_persisted
      end

      it "redirects to the created pt_group_rate" do
        post :create, {:pt_group_rate => valid_attributes}, valid_session
        response.should redirect_to(pt_group_path(:id => valid_attributes[:pt_group_id]))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pt_group_rate as @pt_group_rate" do
        # Trigger the behavior that occurs when invalid params are submitted
        PtGroupRate.any_instance.stub(:save).and_return(false)
        post :create, {:pt_group_rate => {}}, valid_session
        assigns(:pt_group_rate).should be_a_new(PtGroupRate)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PtGroupRate.any_instance.stub(:save).and_return(false)
        post :create, {:pt_group_rate => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested pt_group_rate" do
        pt_group_rate = PtGroupRate.create! valid_attributes
        # Assuming there are no other pt_group_rates in the database, this
        # specifies that the PtGroupRate created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        PtGroupRate.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => pt_group_rate.to_param, :pt_group_rate => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested pt_group_rate as @pt_group_rate" do
        pt_group_rate = PtGroupRate.create! valid_attributes
        put :update, {:id => pt_group_rate.to_param, :pt_group_rate => valid_attributes}, valid_session
        assigns(:pt_group_rate).should eq(pt_group_rate)
      end

      it "redirects to the pt_group_rate" do
        pt_group_rate = PtGroupRate.create! valid_attributes
        put :update, {:id => pt_group_rate.to_param, :pt_group_rate => valid_attributes}, valid_session
        response.should redirect_to(pt_group_rate)
      end
    end

    describe "with invalid params" do
      it "assigns the pt_group_rate as @pt_group_rate" do
        pt_group_rate = PtGroupRate.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PtGroupRate.any_instance.stub(:save).and_return(false)
        put :update, {:id => pt_group_rate.to_param, :pt_group_rate => {}}, valid_session
        assigns(:pt_group_rate).should eq(pt_group_rate)
      end

      it "re-renders the 'edit' template" do
        pt_group_rate = PtGroupRate.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PtGroupRate.any_instance.stub(:save).and_return(false)
        put :update, {:id => pt_group_rate.to_param, :pt_group_rate => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested pt_group_rate" do
      pt_group_rate = PtGroupRate.create! valid_attributes
      expect {
        delete :destroy, {:id => pt_group_rate.to_param}, valid_session
      }.to change(PtGroupRate, :count).by(-1)
    end

    it "redirects to the pt_group_rates list" do
      pt_group_rate = PtGroupRate.create! valid_attributes
      delete :destroy, {:id => pt_group_rate.to_param}, valid_session
      response.should redirect_to(pt_group_rates_url)
    end
  end

end
