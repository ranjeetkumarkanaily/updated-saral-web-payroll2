require 'spec_helper'

describe SalaryAllotmentsController do
  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  describe "Index" do
    it "gets employee whose salary is not allotted" do
      employee = FactoryGirl.create(:employee)
      salary_head = FactoryGirl.create(:salary_head)
      salary_group_detail = FactoryGirl.create(:salary_group_detail,:salary_head_id=>salary_head.id)
      need_to_allot_Sal = FactoryGirl.create(:salary_allotment,:salary_allotment=>0,:employee_id=>employee.id,:salary_group_detail_id=>salary_group_detail.id,:salary_head_id=>salary_head.id)
      get :index
      assigns(:need_to_allot_Sal).should be_true
    end

    it "gets employee whose salary is allotted" do
      employee = FactoryGirl.create(:employee)
      salary_head = FactoryGirl.create(:salary_head)
      salary_group_detail = FactoryGirl.create(:salary_group_detail,:salary_head_id=>salary_head.id)
      already_allot_Sal = FactoryGirl.create(:salary_allotment,:employee_id=>employee.id,:salary_group_detail_id=>salary_group_detail.id,:salary_head_id=>salary_head.id)
      get :index
      assigns(:already_allot_Sal).should be_true
    end
  end

  describe "Edit" do
    it "assigns the requested employee for salary allotment" do
      salary_head = FactoryGirl.create(:salary_head)
      salary_group_detail = FactoryGirl.create(:salary_group_detail,:salary_head_id=>salary_head.id)
      salary_allotment = FactoryGirl.create(:salary_allotment,:salary_group_detail_id=>salary_group_detail.id,:salary_head_id=>salary_head.id)
      get :edit, :id => salary_allotment.employee_id
      assigns(:allotSal).should eq([salary_allotment])
    end
  end

  describe "Update" do
    it "should update the salary allotted amount" do
      salary_head = FactoryGirl.create(:salary_head)
      salary_group_detail = FactoryGirl.create(:salary_group_detail,:salary_head_id=>salary_head.id)
      salAllot = FactoryGirl.create(:salary_allotment,:salary_group_detail_id=>salary_group_detail.id,:salary_head_id=>salary_head.id)
      post :update, :id => salAllot.id, :salAllotment => [salAllot.attributes.merge(:salary_allotment => 2222.00)]
      SalaryAllotment.find_by_id(salAllot.id)[:salary_allotment].should eq(2222.00)
    end
  end

  describe "Excel File Upload, Parse and Save" do

    before :each do
      @state = FactoryGirl.create(:employee)
      @basic = FactoryGirl.create(:salary_head)
      @da = FactoryGirl.create(:salary_head, :head_name => "DA",  :short_name => "DA")
      @hra = FactoryGirl.create(:salary_head, :head_name => "HRA",  :short_name => "HRA")
      @sal_grp = FactoryGirl.create(:salary_group)
      @sal_grp_det = FactoryGirl.create(:salary_group_detail, :salary_group_id => @sal_grp.id, :salary_head_id => @basic.id)
    end

    it "save_parse_validate" do
      excel_file = fixture_file_upload("spec/factories/Employee_Test.xls")
      post :upload_parse_validate, :excel_file => excel_file
      response.should redirect_to(employees_path)
    end

    it "gives error" do
      FactoryGirl.create(:employee, :refno => 1004)
      excel_file = fixture_file_upload("spec/factories/Employee_Test.xls")
      post :upload_parse_validate, :excel_file => excel_file
      response.should be_success
    end

  end

  describe "Generate Sample excel sheet template" do
    it "should render template excel sheet" do
      get :generate_sample_excel_template, :format => "xls"
      response.should render_template('salary_allotments/generate_sample_excel_template.xls')
    end
  end

end