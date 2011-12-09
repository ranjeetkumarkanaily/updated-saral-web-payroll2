require 'spec_helper'


describe EmployeeDetailsController do
  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  def valid_attributes
    {:employee_id => "1",
    :effective_date => "2009-10-31",
    :salary_group_id => "1",
    :allotted_gross => 5000}
  end

  describe "GET index" do
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
      employee_detail = EmployeeDetail.create! valid_attributes
      get :edit, :id => employee_detail.id
      assigns(:employee_detail).should eq(employee_detail)
    end
  end

  describe "POST create" do
    describe "with valid params" do
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
        response.should redirect_to(EmployeeDetail.last)
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
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested employee_detail" do
        employee_detail = EmployeeDetail.create! valid_attributes
        # Assuming there are no other employee_details in the database, this
        # specifies that the EmployeeDetail created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
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
        response.should redirect_to(employee_detail)
      end
    end

    describe "with invalid params" do
      it "assigns the employee_detail as @employee_detail" do
        employee_detail = EmployeeDetail.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EmployeeDetail.any_instance.stub(:save).and_return(false)
        put :update, :id => employee_detail.id, :employee_detail => {}
        assigns(:employee_detail).should eq(employee_detail)
      end

      it "re-renders the 'edit' template" do
        employee_detail = EmployeeDetail.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EmployeeDetail.any_instance.stub(:save).and_return(false)
        put :update, :id => employee_detail.id, :employee_detail => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested employee_detail" do
      employee_detail = EmployeeDetail.create! valid_attributes
      expect {
        delete :destroy, :id => employee_detail.id
      }.to change(EmployeeDetail, :count).by(-1)
    end

    it "redirects to the employee_details list" do
      employee_detail = EmployeeDetail.create! valid_attributes
      delete :destroy, :id => employee_detail.id
      response.should redirect_to(employee_details_url)
    end
  end

end
