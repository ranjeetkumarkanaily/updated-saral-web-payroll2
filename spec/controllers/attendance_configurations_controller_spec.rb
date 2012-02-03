require 'spec_helper'

describe AttendanceConfigurationsController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  def valid_attributes
    {
        :attendance => "Karnataka",
        :short_name => "KARNATAKA",
        :salary_calendar_days => "Actual Days / Month"
    }
  end

  describe "GET index" do
    it "assigns all attendance_configurations as @attendance_configurations" do
      attendance_configuration = FactoryGirl.create(:attendance_configuration)
      get :index
      assigns(:attendance_configurations).should eq([attendance_configuration])
    end
  end

  describe "GET show" do
    it "assigns the requested attendance_configuration as @attendance_configuration" do
      attendance_configuration = AttendanceConfiguration.create! valid_attributes
      get :show, {:id => attendance_configuration.to_param}
      assigns(:attendance_configuration).should eq(attendance_configuration)
    end
  end

  describe "GET new" do
    it "assigns a new attendance_configuration as @attendance_configuration" do
      get :new
      assigns(:attendance_configuration).should be_a_new(AttendanceConfiguration)
    end
  end

  describe "GET edit" do
    it "assigns the requested attendance_configuration as @attendance_configuration" do
      attendance_configuration = AttendanceConfiguration.create! valid_attributes
      get :edit, {:id => attendance_configuration.to_param}
      assigns(:attendance_configuration).should eq(attendance_configuration)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new AttendanceConfiguration" do
        expect {
          post :create, {:attendance_configuration => valid_attributes}
        }.to change(AttendanceConfiguration, :count).by(1)
      end

      it "assigns a newly created attendance_configuration as @attendance_configuration" do
        post :create, {:attendance_configuration => valid_attributes}
        assigns(:attendance_configuration).should be_a(AttendanceConfiguration)
        assigns(:attendance_configuration).should be_persisted
      end

      it "redirects to the created attendance_configuration" do
        post :create, {:attendance_configuration => valid_attributes}
        response.should redirect_to(attendance_configurations_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved attendance_configuration as @attendance_configuration" do
        # Trigger the behavior that occurs when invalid params are submitted
        AttendanceConfiguration.any_instance.stub(:save).and_return(false)
        post :create, {:attendance_configuration => {}}
        assigns(:attendance_configuration).should be_a_new(AttendanceConfiguration)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        AttendanceConfiguration.any_instance.stub(:save).and_return(false)
        post :create, {:attendance_configuration => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested attendance_configuration" do
        attendance_configuration = AttendanceConfiguration.create! valid_attributes
        AttendanceConfiguration.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => attendance_configuration.to_param, :attendance_configuration => {'these' => 'params'}}
      end

      it "assigns the requested attendance_configuration as @attendance_configuration" do
        attendance_configuration = AttendanceConfiguration.create! valid_attributes
        put :update, {:id => attendance_configuration.to_param, :attendance_configuration => valid_attributes}
        assigns(:attendance_configuration).should eq(attendance_configuration)
      end

      it "redirects to the attendance_configuration" do
        attendance_configuration = AttendanceConfiguration.create! valid_attributes
        put :update, {:id => attendance_configuration.to_param, :attendance_configuration => valid_attributes}
        response.should redirect_to(attendance_configurations_url)
      end
    end

    describe "with invalid params" do
      it "assigns the attendance_configuration as @attendance_configuration" do
        attendance_configuration = AttendanceConfiguration.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AttendanceConfiguration.any_instance.stub(:save).and_return(false)
        put :update, {:id => attendance_configuration.to_param, :attendance_configuration => {}}
        assigns(:attendance_configuration).should eq(attendance_configuration)
      end

      it "re-renders the 'edit' template" do
        attendance_configuration = AttendanceConfiguration.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AttendanceConfiguration.any_instance.stub(:save).and_return(false)
        put :update, {:id => attendance_configuration.to_param, :attendance_configuration => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested attendance_configuration" do
      attendance_configuration = AttendanceConfiguration.create! valid_attributes
      expect {
        delete :destroy, {:id => attendance_configuration.to_param}
      }.to change(AttendanceConfiguration, :count).by(-1)
    end

    it "redirects to the attendance_configurations list" do
      attendance_configuration = AttendanceConfiguration.create! valid_attributes
      delete :destroy, {:id => attendance_configuration.to_param}
      response.should redirect_to(attendance_configurations_url)
    end
  end

end
