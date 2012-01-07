require 'spec_helper'

describe DesignationsController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  def valid_attributes
    {
        :designation => "Manager"
    }
  end

  describe "GET index" do
    it "assigns all designations as @designations" do
      designation = Designation.create! valid_attributes
      get :index
      assigns(:designations).should eq([designation])
    end
  end

  describe "GET show" do
    it "assigns the requested designation as @designation" do
      designation = Designation.create! valid_attributes
      get :show, {:id => designation.to_param}
      assigns(:designation).should eq(designation)
    end
  end

  describe "GET new" do
    it "assigns a new designation as @designation" do
      get :new
      assigns(:designation).should be_a_new(Designation)
    end
  end

  describe "GET edit" do
    it "assigns the requested designation as @designation" do
      designation = Designation.create! valid_attributes
      get :edit, {:id => designation.to_param}
      assigns(:designation).should eq(designation)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Designation" do
        expect {
          post :create, {:designation => valid_attributes}
        }.to change(Designation, :count).by(1)
      end

      it "assigns a newly created designation as @designation" do
        post :create, {:designation => valid_attributes}
        assigns(:designation).should be_a(Designation)
        assigns(:designation).should be_persisted
      end

      it "redirects to the created designation" do
        post :create, {:designation => valid_attributes}
        response.should redirect_to(designations_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved designation as @designation" do
        # Trigger the behavior that occurs when invalid params are submitted
        Designation.any_instance.stub(:save).and_return(false)
        post :create, {:designation => {}}
        assigns(:designation).should be_a_new(Designation)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Designation.any_instance.stub(:save).and_return(false)
        post :create, {:designation => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested designation" do
        designation = Designation.create! valid_attributes
        # Assuming there are no other designations in the database, this
        # specifies that the Designation created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Designation.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => designation.to_param, :designation => {'these' => 'params'}}
      end

      it "assigns the requested designation as @designation" do
        designation = Designation.create! valid_attributes
        put :update, {:id => designation.to_param, :designation => valid_attributes}
        assigns(:designation).should eq(designation)
      end

      it "redirects to the designation" do
        designation = Designation.create! valid_attributes
        put :update, {:id => designation.to_param, :designation => valid_attributes}
        response.should redirect_to(designations_url)
      end
    end

    describe "with invalid params" do
      it "assigns the designation as @designation" do
        designation = Designation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Designation.any_instance.stub(:save).and_return(false)
        put :update, {:id => designation.to_param, :designation => {}}
        assigns(:designation).should eq(designation)
      end

      it "re-renders the 'edit' template" do
        designation = Designation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Designation.any_instance.stub(:save).and_return(false)
        put :update, {:id => designation.to_param, :designation => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "does not destroys the requested designation" do
      employee = FactoryGirl.create(:employee)
      expect {
        delete :destroy, {:id => employee.designation.to_param}
      }.to change(Designation, :count).by(0)
    end

    it "destroy the requested designation" do
      employee = FactoryGirl.create(:employee)
      designation = FactoryGirl.create(:designation , designation: "Tester")
      expect {
        delete :destroy, {:id => designation.to_param}
      }.to change(Designation, :count).by(-1)
    end

    it "redirects to the designations list" do
      designation = Designation.create! valid_attributes
      delete :destroy, {:id => designation.to_param}
      response.should redirect_to(designations_url)
    end
  end

end
