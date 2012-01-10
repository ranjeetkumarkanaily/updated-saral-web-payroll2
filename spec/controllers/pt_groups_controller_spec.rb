require 'spec_helper'

describe PtGroupsController do
  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  def valid_attributes
    {
      :name => "PT GRP1",
      :certificate_no => "123456",
      :pto_circle_no => "123456",
      :address => "Bangalore",
      :return_period => "Monthly",
      :state_id => 1
    }
  end
  
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all pt_groups as @pt_groups" do
      pt_group = PtGroup.create! valid_attributes
      get :index, {}, valid_session
      assigns(:pt_groups).should eq([pt_group])
    end
  end

  describe "GET show" do
    it "assigns the requested pt_group as @pt_group" do
      pt_group = PtGroup.create! valid_attributes
      get :show, {:id => pt_group.to_param}, valid_session
      assigns(:pt_group).should eq(pt_group)
    end
  end

  describe "GET new" do
    it "assigns a new pt_group as @pt_group" do
      get :new, {}, valid_session
      assigns(:pt_group).should be_a_new(PtGroup)
    end
  end

  describe "GET edit" do
    it "assigns the requested pt_group as @pt_group" do
      pt_group = PtGroup.create! valid_attributes
      get :edit, {:id => pt_group.to_param}, valid_session
      assigns(:pt_group).should eq(pt_group)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PtGroup" do
        expect {
          post :create, {:pt_group => valid_attributes}, valid_session
        }.to change(PtGroup, :count).by(1)
      end

      it "assigns a newly created pt_group as @pt_group" do
        post :create, {:pt_group => valid_attributes}, valid_session
        assigns(:pt_group).should be_a(PtGroup)
        assigns(:pt_group).should be_persisted
      end

      it "redirects to the created pt_group" do
        post :create, {:pt_group => valid_attributes}, valid_session
        response.should redirect_to(PtGroup.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pt_group as @pt_group" do
        # Trigger the behavior that occurs when invalid params are submitted
        PtGroup.any_instance.stub(:save).and_return(false)
        post :create, {:pt_group => {}}, valid_session
        assigns(:pt_group).should be_a_new(PtGroup)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PtGroup.any_instance.stub(:save).and_return(false)
        post :create, {:pt_group => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested pt_group" do
        pt_group = PtGroup.create! valid_attributes
        # Assuming there are no other pt_groups in the database, this
        # specifies that the PtGroup created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        PtGroup.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => pt_group.to_param, :pt_group => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested pt_group as @pt_group" do
        pt_group = PtGroup.create! valid_attributes
        put :update, {:id => pt_group.to_param, :pt_group => valid_attributes}, valid_session
        assigns(:pt_group).should eq(pt_group)
      end

      it "redirects to the pt_group" do
        pt_group = PtGroup.create! valid_attributes
        put :update, {:id => pt_group.to_param, :pt_group => valid_attributes}, valid_session
        response.should redirect_to(pt_group)
      end
    end

    describe "with invalid params" do
      it "assigns the pt_group as @pt_group" do
        pt_group = PtGroup.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PtGroup.any_instance.stub(:save).and_return(false)
        put :update, {:id => pt_group.to_param, :pt_group => {}}, valid_session
        assigns(:pt_group).should eq(pt_group)
      end

      it "re-renders the 'edit' template" do
        pt_group = PtGroup.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PtGroup.any_instance.stub(:save).and_return(false)
        put :update, {:id => pt_group.to_param, :pt_group => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested pt_group" do
      pt_group = PtGroup.create! valid_attributes
      expect {
        delete :destroy, {:id => pt_group.to_param}, valid_session
      }.to change(PtGroup, :count).by(-1)
    end

    it "redirects to the pt_groups list" do
      pt_group = PtGroup.create! valid_attributes
      delete :destroy, {:id => pt_group.to_param}, valid_session
      response.should redirect_to(pt_groups_url)
    end
  end

end
