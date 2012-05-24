require 'spec_helper'

describe LeaveOpeningBalancesController do
  before :each do
    controller.stub(:logged_in?).and_return(true)
  end
  def valid_attributes
    {
        :employee_id => 1,
        :leave_definition_id => 1,
        :opening_balance => 3
    }
  end


  describe "GET upload" do
    it "assigns all leave opening balances as @opbal" do
      employee = FactoryGirl.create(:employee)
      leave_definition = FactoryGirl.create(:leave_definition)
      opbal = LeaveOpeningBalance.create! valid_attributes.merge(:employee_id=>employee.id,:leave_definition_id=>leave_definition.id)
      get :upload, {}
      assigns(:opbal).should eq(opbal)
    end
  end

  describe " Post Excel File Upload, Parse and Save" do
    it "save parse validate and redirects to upload with no error message" do
      employee = FactoryGirl.create(:employee)
      leave_definition = FactoryGirl.create(:leave_definition)
      excel_file = fixture_file_upload("spec/factories/Leave_opening_balance.xls")
      post :save_uploaded_data, :excel_file => excel_file
      response.should redirect_to(upload_leave_opening_balances_path)
    end

    it "parse and validate and redirects to upload with error message" do
      employee = FactoryGirl.create(:employee)
      leave_definition = FactoryGirl.create(:leave_definition)
      leave_opening_balance = FactoryGirl.create(:leave_opening_balance,:employee_id=>employee.id,:leave_definition_id=>leave_definition.id)
      excel_file = fixture_file_upload("spec/factories/Leave_opening_balance.xls")
      post :save_uploaded_data, :excel_file => excel_file
      response.should redirect_to(upload_leave_opening_balances_path)

    end
  end



end
