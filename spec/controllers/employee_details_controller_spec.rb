require 'spec_helper'


describe EmployeeDetailsController do
  before :each do
    controller.stub(:logged_in?).and_return(true)

    @branch = FactoryGirl.create(:branch)
    @financial_institution = FactoryGirl.create(:financial_institution)
    @attendance_configuration = FactoryGirl.create(:attendance_configuration)
  end

  def valid_attributes
    {:employee_id => "1",
    :effective_date => "2012-01-01",
    :salary_group_id => "1",
    :allotted_gross => 5000,
    :classification =>{'Department' => 'development'},
    :branch_id => @branch.id,
    :financial_institution_id => @financial_institution.id,
    :attendance_configuration_id => @attendance_configuration.id,
    :bank_account_number => 2316,
    :effective_to => '',
    }
  end

  describe "GET index" do
    before :each do
      @employee = FactoryGirl.create(:employee)
    end
    it "assigns all employee_details as @employee_details" do
      employee_detail = EmployeeDetail.create! valid_attributes
      get :index
      assigns(:employee_details).should eq([employee_detail])
    end

    it "assigns employee_details of specific as @employee_details" do
      employee_detail = EmployeeDetail.create! valid_attributes
      get :index, :param1 => 1
      assigns(:employee_details).should eq([employee_detail])
    end
  end

  describe "GET show" do

    it "assigns the requested employee_detail as @employee_detail" do
      employee = FactoryGirl.create(:employee)
      employee_detail = EmployeeDetail.create! valid_attributes
      get :show, :id => employee_detail.id
      assigns(:employee_detail).should eq(employee_detail)
    end
  end

  describe "GET new" do
    it "assigns a new employee_detail as @employee_detail" do
      get :new
      assigns(:employee_detail).should be_a_new(EmployeeDetail)
    end
  end

  describe "GET edit" do

    it "assigns the requested employee_detail as @employee_detail" do
      employee = FactoryGirl.create(:employee)
      employee_detail = EmployeeDetail.create! valid_attributes
      get :edit, :id => employee_detail.id
      assigns(:employee_detail).should eq(employee_detail)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      before :each do
        @employee = FactoryGirl.create(:employee)
      end
      it "creates a new EmployeeDetail" do
        expect {
          post :create, :employee_detail => valid_attributes
        }.to change(EmployeeDetail, :count).by(1)
      end

      it "creates salary allotments for the employee details created" do
        FactoryGirl.create(:salary_group_detail)
        expect {
          post :create, :employee_detail => valid_attributes
        }.to change(SalaryAllotment, :count)
      end

      it "assigns a newly created employee_detail as @employee_detail" do
        post :create, :employee_detail => valid_attributes
        assigns(:employee_detail).should be_a(EmployeeDetail)
        assigns(:employee_detail).should be_persisted
      end

      it "redirects to the created employee_detail" do
        post :create, :employee_detail => valid_attributes
        response.should redirect_to(employee_details_path(:param1 => valid_attributes[:employee_id]))
      end
    end

    describe "with invalid params" do

      it "assigns a newly created but unsaved employee_detail as @employee_detail" do
        # Trigger the behavior that occurs when invalid params are submitted
        EmployeeDetail.any_instance.stub(:save).and_return(false)
        post :create, :employee_detail => {}
        assigns(:employee_detail).should be_a_new(EmployeeDetail)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        EmployeeDetail.any_instance.stub(:save).and_return(false)
        post :create, :employee_detail => {}
        response.should render_template("new")
      end
    end
    describe "validation for the effective date" do
      it "validation with date of joining" do
        employee = FactoryGirl.create(:employee)
        EmployeeDetail.any_instance.stub(:save).and_return(false)
        post :create, :employee_detail => valid_attributes.merge(:effective_date => '2009-01-01')
        assigns(:employee_detail).should be_a_new(EmployeeDetail)
      end

      it "validation with date of leaving" do
        employee = FactoryGirl.create(:employee,:date_of_leaving => '2011-03-03')
        EmployeeDetail.any_instance.stub(:save).and_return(false)
        post :create, :employee_detail => valid_attributes.merge(:effective_date => '2011-04-01',:employee_id => employee.id)
        assigns(:employee_detail).should be_a_new(EmployeeDetail)
      end

      it "validation with saved effective dates" do
        employee = FactoryGirl.create(:employee)
        employee_details_prev = FactoryGirl.create(:employee_detail,:branch_id => @branch.id,:financial_institution_id => @financial_institution.id,:attendance_configuration_id => @attendance_configuration.id)
        EmployeeDetail.any_instance.stub(:save).and_return(false)
        post :create, :employee_detail => valid_attributes.merge(:effective_date => '2009-01-01')
        assigns(:employee_detail).should be_a_new(EmployeeDetail)
      end

    end

  end

  describe "PUT update" do
    before :each do
      @employee = FactoryGirl.create(:employee)
    end
    describe "with valid params" do

      it "updates the requested employee_detail" do
        employee_detail = EmployeeDetail.create! valid_attributes, :panoption => "ADD PAN"
        EmployeeDetail.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => employee_detail.id, :employee_detail => {'these' => 'params'}
      end

      it "assigns the requested employee_detail as @employee_detail" do
        employee_detail = EmployeeDetail.create! valid_attributes
        put :update, :id => employee_detail.id, :employee_detail => valid_attributes
        assigns(:employee_detail).should eq(employee_detail)
      end

      it "redirects to the employee_detail" do
        employee_detail = EmployeeDetail.create! valid_attributes
        put :update, :id => employee_detail.id, :employee_detail => valid_attributes
        response.should redirect_to(employee_details_path(:param1 => valid_attributes[:employee_id]))
      end
    end

    describe "with invalid params" do
      it "assigns the employee_detail as @employee_detail" do
        employee_detail = EmployeeDetail.create! valid_attributes
        EmployeeDetail.any_instance.stub(:save).and_return(false)
        put :update, :id => employee_detail.id, :employee_detail => {}
        assigns(:employee_detail).should eq(employee_detail)
      end

      it "re-renders the 'edit' template" do
        employee_detail = EmployeeDetail.create! valid_attributes
        EmployeeDetail.any_instance.stub(:save).and_return(false)
        put :update, :id => employee_detail.id, :employee_detail => {}
        response.should render_template("edit")
      end



    end
  end

  describe "DELETE destroy" do
    before :each do
      @employee = FactoryGirl.create(:employee)
    end
    it "destroys the requested employee_detail" do
      employee_detail = EmployeeDetail.create! valid_attributes.merge(:employee_id => @employee.id)
      expect {
        delete :destroy, :id => employee_detail.id
      }.to change(EmployeeDetail, :count).by(-1)
    end

    it "redirects to the employee_details list and updates the last record's effective date'" do
      employee_detail_first = FactoryGirl.create(:employee_detail,:branch_id => @branch.id,:financial_institution_id => @financial_institution.id,:attendance_configuration_id => @attendance_configuration.id)
      employee_detail_second = EmployeeDetail.create! valid_attributes.merge(:employee_id => @employee.id)
      delete :destroy, :id => employee_detail_second.id
      response.should redirect_to(employee_details_path(:param1 => valid_attributes[:employee_id] ))
    end

    it "redirects to the employee_details list" do
      employee_detail = EmployeeDetail.create! valid_attributes
      delete :destroy, :id => employee_detail.id
      response.should redirect_to(employee_details_path(:param1 => valid_attributes[:employee_id] ))
    end
  end

end
