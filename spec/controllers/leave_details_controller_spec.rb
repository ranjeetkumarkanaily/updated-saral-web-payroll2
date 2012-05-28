require 'spec_helper'

describe LeaveDetailsController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
  end
  def valid_attributes
    {
        :employee_id => 1,
        :leave_definition_id => 1,
        :leave_date => '2011-01-01'
    }
  end
  describe "Get index" do
    it "assign all leave details as @leave_detail" do
      employee = FactoryGirl.create(:employee)
      leave_definition = FactoryGirl.create(:leave_definition)
      leave_detail = FactoryGirl.create(:leave_detail,:employee_id=>employee.id,:leave_definition_id=>leave_definition.id)
      get :index
      assigns(:leave_details).should eq([leave_detail])
    end
  end

  describe "GET new" do
    it "assigns a new leave_detail as @leave_detail" do
      get :new
      assigns(:leave_detail).should be_a_new(LeaveDetail)
    end
  end

  describe "GET edit" do
    it "assigns the requested leave_detail as @leave_detail" do
      employee = FactoryGirl.create(:employee)
      leave_definition = FactoryGirl.create(:leave_definition)
      leave_detail = LeaveDetail.create! valid_attributes.merge(:employee_id=>employee.id,:leave_definition_id=>leave_definition.id)
      get :edit, {:id => leave_detail.to_param}
      assigns(:leave_detail).should eq(leave_detail)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new LeaveDetail" do
        expect {
          employee = FactoryGirl.create(:employee)
          leave_definition = FactoryGirl.create(:leave_definition)
          post :create, {:leave_detail => valid_attributes.merge(:employee_id=>employee.id,:leave_definition_id=>leave_definition.id)}
        }.to change(LeaveDetail, :count).by(1)
      end

      it "assigns a newly created leave_definition as @leave_definition" do
        employee = FactoryGirl.create(:employee)
        leave_definition = FactoryGirl.create(:leave_definition)
        post :create, {:leave_detail => valid_attributes.merge(:employee_id=>employee.id,:leave_definition_id=>leave_definition.id)}
        assigns(:leave_detail).should be_a(LeaveDetail)
        assigns(:leave_detail).should be_persisted
      end

      it "redirects to the created leave_definition" do
        employee = FactoryGirl.create(:employee)
        leave_definition = FactoryGirl.create(:leave_definition)
        post :create, {:leave_detail => valid_attributes.merge(:employee_id=>employee.id,:leave_definition_id=>leave_definition.id)}
        response.should redirect_to(leave_details_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved leave_definition as @leave_definition" do
        # Trigger the behavior that occurs when invalid params are submitted
        LeaveDetail.any_instance.stub(:save).and_return(false)
        post :create, {:leave_detail => {}}
        assigns(:leave_detail).should be_a_new(LeaveDetail)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        LeaveDetail.any_instance.stub(:save).and_return(false)
        post :create, {:leave_detail => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested leave_detail" do
        employee = FactoryGirl.create(:employee)
        leave_definition = FactoryGirl.create(:leave_definition)
        leave_detail = LeaveDetail.create! valid_attributes.merge(:employee_id=>employee.id,:leave_definition_id=>leave_definition.id)
        LeaveDetail.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => leave_detail.to_param, :leave_detail => {'these' => 'params'}}
      end

      it "assigns the requested leave_detail as @leave_detail" do
        employee = FactoryGirl.create(:employee)
        leave_definition = FactoryGirl.create(:leave_definition)
        leave_detail = LeaveDetail.create! valid_attributes.merge(:employee_id=>employee.id,:leave_definition_id=>leave_definition.id)
        put :update, {:id => leave_detail.to_param, :leave_detail => valid_attributes.merge(:employee_id=>employee.id,:leave_definition_id=>leave_definition.id)}
        assigns(:leave_detail).should eq(leave_detail)
      end

      it "redirects to the leave_detail" do
        employee = FactoryGirl.create(:employee)
        leave_definition = FactoryGirl.create(:leave_definition)
        leave_detail = LeaveDetail.create! valid_attributes.merge(:employee_id=>employee.id,:leave_definition_id=>leave_definition.id)
        put :update, {:id => leave_detail.to_param, :leave_detail => valid_attributes.merge(:employee_id=>employee.id,:leave_definition_id=>leave_definition.id)}
        response.should redirect_to(leave_details_url)
      end
    end

    describe "with invalid params" do
      it "assigns the leave_detail as @leave_detail" do
        employee = FactoryGirl.create(:employee)
        leave_definition = FactoryGirl.create(:leave_definition)
        leave_detail = LeaveDetail.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        LeaveDetail.any_instance.stub(:save).and_return(false)
        put :update, {:id => leave_detail.to_param, :leave_detail => {}}
        assigns(:leave_detail).should eq(leave_detail)
      end

      it "re-renders the 'edit' template" do
        employee = FactoryGirl.create(:employee)
        leave_definition = FactoryGirl.create(:leave_definition)
        leave_detail = LeaveDetail.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        LeaveDetail.any_instance.stub(:save).and_return(false)
        put :update, {:id => leave_detail.to_param, :leave_detail => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested leave_detail" do
      employee = FactoryGirl.create(:employee)
      leave_definition = FactoryGirl.create(:leave_definition)
      leave_detail = LeaveDetail.create! valid_attributes.merge(:employee_id=>employee.id,:leave_definition_id=>leave_definition.id)
      expect {
        delete :destroy, {:id => leave_detail.to_param}
      }.to change(LeaveDetail, :count).by(-1)
    end

    it "redirects to the leave_detail list" do
      employee = FactoryGirl.create(:employee)
      leave_definition = FactoryGirl.create(:leave_definition)
      leave_detail = LeaveDetail.create! valid_attributes.merge(:employee_id=>employee.id,:leave_definition_id=>leave_definition.id)
      delete :destroy, {:id => leave_detail.to_param}
      response.should redirect_to(leave_details_url)
    end
  end

  describe "Excel File Upload, Parse and Save" do
    it "save_parse_validate" do
      employee = FactoryGirl.create(:employee)
      leave_definition = FactoryGirl.create(:leave_definition)
      leave_detail = FactoryGirl.create(:leave_detail,:employee_id=>employee.id,:leave_definition_id=>leave_definition.id)
      excel_file = fixture_file_upload("spec/factories/Leave_Details.xls")
      post :upload_parse_validate, :excel_file => excel_file
      response.should be_success
    end

    it "gives error" do
      employee = FactoryGirl.create(:employee)
      leave_definition = FactoryGirl.create(:leave_definition)
      leave_detail = FactoryGirl.create(:leave_detail,:employee_id=>employee.id,:leave_definition_id=>leave_definition.id,:leave_date=>'2011-02-01')
      excel_file = fixture_file_upload("spec/factories/Leave_Details.xls")
      post :upload_parse_validate, :excel_file => excel_file
      response.should be_success
    end

    it "gives error for duplication of columns" do
      employee = FactoryGirl.create(:employee)
      leave_definition = FactoryGirl.create(:leave_definition)
      leave_detail = FactoryGirl.create(:leave_detail,:employee_id=>employee.id,:leave_definition_id=>leave_definition.id)
      excel_file = fixture_file_upload("spec/factories/Leave_Details_Hd_Dup.xls")
      post :upload_parse_validate, :excel_file => excel_file
      response.should be_success
    end

    it "save" do
      leave_detail = FactoryGirl.build(:leave_detail)
      post :save, :leave_details => [leave_detail]
      response.should redirect_to(leave_details_path)
    end
  end

  describe "Generate Sample excel sheet template" do
    it "should render template excel sheet" do
      get :generate_sample_excel_template, :format => "xls"
      response.should render_template('leave_details/generate_sample_excel_template')
    end
  end
end
