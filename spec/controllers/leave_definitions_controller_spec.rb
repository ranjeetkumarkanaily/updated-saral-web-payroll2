require 'spec_helper'


describe LeaveDefinitionsController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  def valid_attributes
    {
        :leave_name => "Casual Leave",
        :short_name => "CL"
    }
  end
  
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all leave_definitions as @leave_definitions" do
      leave_definition = LeaveDefinition.create! valid_attributes
      get :index, {}, valid_session
      assigns(:leave_definitions).should eq([leave_definition])
    end
  end

  describe "GET show" do
    it "assigns the requested leave_definition as @leave_definition" do
      leave_definition = LeaveDefinition.create! valid_attributes
      get :show, {:id => leave_definition.to_param}, valid_session
      assigns(:leave_definition).should eq(leave_definition)
    end
  end

  describe "GET new" do
    it "assigns a new leave_definition as @leave_definition" do
      get :new, {}, valid_session
      assigns(:leave_definition).should be_a_new(LeaveDefinition)
    end
  end

  describe "GET edit" do
    it "assigns the requested leave_definition as @leave_definition" do
      leave_definition = LeaveDefinition.create! valid_attributes
      get :edit, {:id => leave_definition.to_param}, valid_session
      assigns(:leave_definition).should eq(leave_definition)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new LeaveDefinition" do
        expect {
          post :create, {:leave_definition => valid_attributes}, valid_session
        }.to change(LeaveDefinition, :count).by(1)
      end

      it "assigns a newly created leave_definition as @leave_definition" do
        post :create, {:leave_definition => valid_attributes}, valid_session
        assigns(:leave_definition).should be_a(LeaveDefinition)
        assigns(:leave_definition).should be_persisted
      end

      it "redirects to the created leave_definition" do
        post :create, {:leave_definition => valid_attributes}, valid_session
        response.should redirect_to(leave_definitions_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved leave_definition as @leave_definition" do
        # Trigger the behavior that occurs when invalid params are submitted
        LeaveDefinition.any_instance.stub(:save).and_return(false)
        post :create, {:leave_definition => {}}, valid_session
        assigns(:leave_definition).should be_a_new(LeaveDefinition)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        LeaveDefinition.any_instance.stub(:save).and_return(false)
        post :create, {:leave_definition => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested leave_definition" do
        leave_definition = LeaveDefinition.create! valid_attributes
        # Assuming there are no other leave_definitions in the database, this
        # specifies that the LeaveDefinition created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        LeaveDefinition.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => leave_definition.to_param, :leave_definition => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested leave_definition as @leave_definition" do
        leave_definition = LeaveDefinition.create! valid_attributes
        put :update, {:id => leave_definition.to_param, :leave_definition => valid_attributes}, valid_session
        assigns(:leave_definition).should eq(leave_definition)
      end

      it "redirects to the leave_definition" do
        leave_definition = LeaveDefinition.create! valid_attributes
        put :update, {:id => leave_definition.to_param, :leave_definition => valid_attributes}, valid_session
        response.should redirect_to(leave_definitions_url)
      end
    end

    describe "with invalid params" do
      it "assigns the leave_definition as @leave_definition" do
        leave_definition = LeaveDefinition.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        LeaveDefinition.any_instance.stub(:save).and_return(false)
        put :update, {:id => leave_definition.to_param, :leave_definition => {}}, valid_session
        assigns(:leave_definition).should eq(leave_definition)
      end

      it "re-renders the 'edit' template" do
        leave_definition = LeaveDefinition.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        LeaveDefinition.any_instance.stub(:save).and_return(false)
        put :update, {:id => leave_definition.to_param, :leave_definition => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested leave_definition" do
      leave_definition = LeaveDefinition.create! valid_attributes
      expect {
        delete :destroy, {:id => leave_definition.to_param}, valid_session
      }.to change(LeaveDefinition, :count).by(-1)
    end

    it "redirects to the leave_definitions list" do
      leave_definition = LeaveDefinition.create! valid_attributes
      delete :destroy, {:id => leave_definition.to_param}, valid_session
      response.should redirect_to(leave_definitions_url)
    end
  end

end
