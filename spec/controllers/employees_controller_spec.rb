require 'spec_helper'


describe EmployeesController do
  before :each do
    controller.stub(:logged_in?).and_return(true)
  end


  def valid_attributes
    {
      :empname => "GaneshL",
      :date_of_joining => "2009-10-31",
      :date_of_leaving => "2010-11-30",
      :present_state_id => "1",
      :refno => "A1",
      :email => "ganny@gnaa.com",
      :designation_id => '1',
      :department_id => '1',
      :grade_id => '1',
      :restrct_pf => false
    }
  end

  describe "Excel File Upload, Parse and Save" do

    before :each do
      @state = FactoryGirl.create(:state)
      @dept = FactoryGirl.create(:department)
      @desig = FactoryGirl.create(:designation)
      @grade = FactoryGirl.create(:grade)
    end

    it "save_parse_validate" do
      excel_file = fixture_file_upload("spec/factories/Employee_Test.xls")
      post :upload_parse_validate, :excel_file => excel_file
      response.should redirect_to(employees_path)
    end

    it "gives error" do
      FactoryGirl.create(:employee, :refno => 1004, :department => @dept, :designation => @desig, :grade => @grade)
      excel_file = fixture_file_upload("spec/factories/Employee_Test.xls")
      post :upload_parse_validate, :excel_file => excel_file
      response.should be_success
    end

  end

  describe "GET index" do
    before :each do
      @employee = FactoryGirl.create(:employee)
    end
    it "assigns all employees as @employees" do
      get :index
      assigns(:employees).should eq([@employee])
    end

    it "search all employee for entered keyword" do
      get :index, :search => 'XYZ'
      assigns(:employees).should eq([@employee])
    end
  end

  describe "GET show" do
    it "assigns the requested employee as @employee" do
      employee = FactoryGirl.create(:employee)
      get :show, :id => employee.id
      assigns(:employee).should eq(employee)
    end
  end

  describe "GET new" do
    it "assigns a new employee as @employee" do
      get :new
      assigns(:employee).should be_a_new(Employee)
    end
  end

  describe "GET edit" do
    it "assigns the requested employee as @employee" do
      employee = FactoryGirl.create(:employee)
      get :edit, :id => employee.id
      assigns(:employee).should eq(employee)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      before :each do
        @employee = FactoryGirl.build(:employee)
      end
      it "Count should be increases by one" do
        expect {
          post :create, :employee => @employee.attributes
        }.to change(Employee, :count).by(1)
      end



      it "assigns a newly created employee as @employee" do
        post :create, :employee => @employee.attributes
        assigns(:employee).should be_a(Employee)
        assigns(:employee).should be_persisted
      end

      it "redirects to the created employee" do
        post :create, :employee => @employee.attributes
        response.should redirect_to(Employee.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved employee as @employee" do
        # Trigger the behavior that occurs when invalid params are submitted
        Employee.any_instance.stub(:save).and_return(false)
        post :create, :employee => {}
        assigns(:employee).should be_a_new(Employee)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Employee.any_instance.stub(:save).and_return(false)
        post :create, :employee => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before :each do
        @employee = FactoryGirl.create(:employee)
      end
      it "updates the requested employee" do
        Employee.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => @employee.id, :employee => {'these' => 'params'}
      end

      it "assigns the requested employee as @employee" do
        put :update, :id => @employee.id, :employee => @employee.attributes
        assigns(:employee).should eq(@employee)
      end

      it "redirects to the employee" do
        put :update, :id => @employee.id, :employee => @employee.attributes
        response.should redirect_to(@employee)
      end
    end

    describe "with invalid params" do
      it "assigns the employee as @employee" do
        employee = FactoryGirl.create(:employee)
        # Trigger the behavior that occurs when invalid params are submitted
        Employee.any_instance.stub(:save).and_return(false)
        put :update, :id => employee.id, :employee => {}
        assigns(:employee).should eq(employee)
      end

      it "re-renders the 'edit' template" do
        employee = FactoryGirl.create(:employee)
        # Trigger the behavior that occurs when invalid params are submitted
        Employee.any_instance.stub(:save).and_return(false)
        put :update, :id => employee.id, :employee => {}
        response.should render_template("edit")
      end
    end
  end

  describe "GET report" do
    it "should generate report for other than contact info" do
      employees = FactoryGirl.create(:employee)
      get :report, :report_type => 'date_of_joining', "report"=>{"designation_id"=>employees.designation_id,"department_id"=>employees.department.id,"grade_id"=>employees.grade_id}
      assigns(:employees).should_not be_nil
    end

    it "should generate report for contact info" do
      employees = FactoryGirl.create(:employee)
      get :report, :report_type => 'Contact', "report"=>{"designation_id"=>employees.designation_id,"department_id"=>employees.department.id,"grade_id"=>employees.grade_id}
      assigns(:employees).should_not be_nil
    end

    it "generates pdf output" do
      employees = FactoryGirl.create(:employee)
      get :report, :report_type => 'Contact', "report"=>{"designation_id"=>employees.designation_id,"department_id"=>employees.department.id,"grade_id"=>employees.grade_id}, :format => "pdf"
      response.should render_template('employees/report.pdf')
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested employee" do
      employee = FactoryGirl.create(:employee)
      expect {
        delete :destroy, :id => employee.id
      }.to change(Employee, :count).by(-1)
    end

    it "redirects to the employees list" do
      employee = FactoryGirl.create(:employee)
      delete :destroy, :id => employee.id
      response.should redirect_to(employees_url)
    end
  end

  describe "GET pf_contribution_restrict" do
    before :each do
      @employee = FactoryGirl.create(:employee)
    end
    it "assigns all employees as @employees" do
      get :pf_contribution_restrict
      assigns(:employeesList).should eq([@employee])
    end

    it "assigns all employees as @employees" do
      get :pf_contribution_restrict, :search => "XYZ"
      assigns(:employeesList).should eq([@employee])
    end
  end

  describe "pf_restrict_update" do

    before :each do
      @employee=FactoryGirl.create(:employee)
    end

    it "should update employees restrict_pf Value for true" do
      put :pf_restrict_update,:employee_data => [:id => @employee.id, :pf => true]
      Employee.find_by_id(@employee.id)[:restrct_pf].should eq(true)
    end

    it "should update employees restrict_pf Value for false" do
      put :pf_restrict_update,:employee_data => [:id => @employee.id, :pf => nil]
      Employee.find_by_id(@employee.id)[:restrct_pf].should eq(false)
    end
  end

end
