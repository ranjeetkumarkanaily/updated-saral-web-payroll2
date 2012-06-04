require 'spec_helper'

describe LeaveTakensController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  def valid_attributes
    {
        :employee_id => 1,
        :from_date => '2012-01-01',
        :count => 1
    }
  end

  describe "GET index" do
    it "assigns all leave_takens as @leave_takens" do
      employee = FactoryGirl.create(:employee)
      leave_taken = LeaveTaken.create! valid_attributes.merge(:employee_id => employee.id)
      get :index, {}
      assigns(:leave_takens).should eq([leave_taken])
    end
  end

  describe "GET show" do
    it "assigns the requested leave_taken as @leave_taken" do
      employee = FactoryGirl.create(:employee)
      leave_taken = LeaveTaken.create! valid_attributes.merge(:employee_id => employee.id)
      get :show, {:id => leave_taken.to_param}
      assigns(:leave_taken).should eq(leave_taken)
    end
  end

  describe "GET new" do
    it "assigns a new leave_taken as @leave_taken" do
      get :new, {}
      assigns(:leave_taken).should be_a_new(LeaveTaken)
    end
  end

  describe "GET edit" do
    it "assigns the requested leave_taken as @leave_taken" do
      employee = FactoryGirl.create(:employee)
      leave_taken = LeaveTaken.create! valid_attributes.merge(:employee_id => employee.id)
      get :edit, {:id => leave_taken.to_param}
      assigns(:leave_taken).should eq(leave_taken)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new LeaveTaken" do
        expect {
          employee = FactoryGirl.create(:employee)
          post :create, {:leave_taken => valid_attributes.merge(:employee_id => employee.id)}
        }.to change(LeaveTaken, :count).by(1)
      end

      it "assigns a newly created leave_taken as @leave_taken" do
        employee = FactoryGirl.create(:employee)
        post :create, {:leave_taken => valid_attributes.merge(:employee_id => employee.id)}
        assigns(:leave_taken).should be_a(LeaveTaken)
        assigns(:leave_taken).should be_persisted
      end

      it "redirects to the created leave_taken" do
        employee = FactoryGirl.create(:employee)
        post :create, {:leave_taken => valid_attributes.merge(:employee_id => employee.id)}
        response.should redirect_to(LeaveTaken.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved leave_taken as @leave_taken" do
        # Trigger the behavior that occurs when invalid params are submitted
        LeaveTaken.any_instance.stub(:save).and_return(false)
        post :create, {:leave_taken => {}}
        assigns(:leave_taken).should be_a_new(LeaveTaken)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        LeaveTaken.any_instance.stub(:save).and_return(false)
        post :create, {:leave_taken => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested leave_taken" do
        employee = FactoryGirl.create(:employee)
        leave_taken = LeaveTaken.create! valid_attributes.merge(:employee_id => employee.id)
        LeaveTaken.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => leave_taken.to_param, :leave_taken => {'these' => 'params'}}
      end

      it "assigns the requested leave_taken as @leave_taken" do
        employee = FactoryGirl.create(:employee)
        leave_taken = LeaveTaken.create! valid_attributes.merge(:employee_id => employee.id)
        put :update, {:id => leave_taken.to_param, :leave_taken => valid_attributes}
        assigns(:leave_taken).should eq(leave_taken)
      end

      it "redirects to the leave_taken" do
        employee = FactoryGirl.create(:employee)
        leave_taken = LeaveTaken.create! valid_attributes.merge(:employee_id => employee.id)
        put :update, {:id => leave_taken.to_param, :leave_taken => valid_attributes}
        response.should redirect_to(leave_taken)
      end
    end

    describe "with invalid params" do
      it "assigns the leave_taken as @leave_taken" do
        employee = FactoryGirl.create(:employee)
        leave_taken = LeaveTaken.create! valid_attributes.merge(:employee_id => employee.id)
        # Trigger the behavior that occurs when invalid params are submitted
        LeaveTaken.any_instance.stub(:save).and_return(false)
        put :update, {:id => leave_taken.to_param, :leave_taken => {}}
        assigns(:leave_taken).should eq(leave_taken)
      end

      it "re-renders the 'edit' template" do
        employee = FactoryGirl.create(:employee)
        leave_taken = LeaveTaken.create! valid_attributes.merge(:employee_id => employee.id)
        # Trigger the behavior that occurs when invalid params are submitted
        LeaveTaken.any_instance.stub(:save).and_return(false)
        put :update, {:id => leave_taken.to_param, :leave_taken => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested leave_taken" do
      employee = FactoryGirl.create(:employee)
      leave_taken = LeaveTaken.create! valid_attributes.merge(:employee_id => employee.id)
      expect {
        delete :destroy, {:id => leave_taken.to_param}
      }.to change(LeaveTaken, :count).by(-1)
    end

    it "redirects to the leave_takens list" do
      employee = FactoryGirl.create(:employee)
      leave_taken = LeaveTaken.create! valid_attributes.merge(:employee_id => employee.id)
      delete :destroy, {:id => leave_taken.to_param}
      response.should redirect_to(leave_takens_url)
    end
  end

end
