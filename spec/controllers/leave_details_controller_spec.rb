require 'spec_helper'

describe LeaveDetailsController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  describe "Get index" do
    it "assign all leave details as @leave_detail" do
      leave_detail = FactoryGirl.create(:leave_detail)
      get :index
      assigns(:leave_details).should eq([leave_detail])
    end
  end


  describe "Excel File Upload, Parse and Save" do
    it "save_parse_validate" do
      DatabaseCleaner.clean
      FactoryGirl.create(:leave_detail)
      excel_file = fixture_file_upload("spec/factories/Leave_Details.xls")
      post :upload_parse_validate, :excel_file => excel_file
      response.should be_success
    end

    it "gives error" do
      excel_file = fixture_file_upload("spec/factories/Leave_Details.xls")
      post :upload_parse_validate, :excel_file => excel_file
      response.should be_success
      DatabaseCleaner.clean
    end


    it "save" do
      leave_detail = Factory.build(:leave_detail)
      post :save, :leave_details => [leave_detail]
      response.should redirect_to(leave_details_path)
    end
  end
end
