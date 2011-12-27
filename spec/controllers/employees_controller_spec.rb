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
    :email => "ganny@gnaa.com"
    }
  end

  describe "GET index" do
    it "assigns all employees as @employees" do
      employee = Employee.create! valid_attributes
      get :index
      assigns(:employees).should eq([employee])
    end
  end

  describe "GET show" do
    it "assigns the requested employee as @employee" do
      employee = Employee.create! valid_attributes
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
      employee = Employee.create! valid_attributes
      get :edit, :id => employee.id
      assigns(:employee).should eq(employee)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Employee" do
        expect {
          post :create, :employee => valid_attributes
        }.to change(Employee, :count).by(1)
      end

      it "assigns a newly created employee as @employee" do
        post :create, :employee => valid_attributes
        assigns(:employee).should be_a(Employee)
        assigns(:employee).should be_persisted
      end

      it "redirects to the created employee" do
        post :create, :employee => valid_attributes
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
      it "updates the requested employee" do
        employee = Employee.create! valid_attributes
        # Assuming there are no other employees in the database, this
        # specifies that the Employee created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Employee.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => employee.id, :employee => {'these' => 'params'}
      end

      it "assigns the requested employee as @employee" do
        employee = Employee.create! valid_attributes
        put :update, :id => employee.id, :employee => valid_attributes
        assigns(:employee).should eq(employee)
      end

      it "redirects to the employee" do
        employee = Employee.create! valid_attributes
        put :update, :id => employee.id, :employee => valid_attributes
        response.should redirect_to(employee)
      end
    end

    describe "with invalid params" do
      it "assigns the employee as @employee" do
        employee = Employee.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Employee.any_instance.stub(:save).and_return(false)
        put :update, :id => employee.id, :employee => {}
        assigns(:employee).should eq(employee)
      end

      it "re-renders the 'edit' template" do
        employee = Employee.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Employee.any_instance.stub(:save).and_return(false)
        put :update, :id => employee.id, :employee => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested employee" do
      employee = Employee.create! valid_attributes
      expect {
        delete :destroy, :id => employee.id
      }.to change(Employee, :count).by(-1)
    end

    it "redirects to the employees list" do
      employee = Employee.create! valid_attributes
      delete :destroy, :id => employee.id
      response.should redirect_to(employees_url)
    end
  end

  #describe "Excel File Upload, Parse and Save" do
  #  describe "save_parse_validate" do
  #    my_file = fixture_file_upload("#{::Rails.root.to_s}/spec/factories/Employee_Test.xls")
  #    post :upload_parse_validate, :excel_file => my_file
  #    response.should be_success
  #  end
  #
  #  describe "save" do
  #    assign(params[:employees], [
  #    stub_model(Employee,
  #      :empname => "Empname"
  #    )])
  #  end
  #end
end
