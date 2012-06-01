require 'spec_helper'


describe EmployeeStatutoriesController do
  before :each do
    controller.stub(:logged_in?).and_return(true)
    @employee = FactoryGirl.create(:employee, :date_of_birth => '1980-01-01')
  end
  def valid_attributes
    { :employee_id => @employee.id ,
      :pan => 'aaaaa1234a',
      :pan_effective_date => '2012-01-01',
      :pf_number => '1234',
      :pf_effective_date => '2012-01-01',
      :esi_number => 'a1234',
      :esi_effective_date => '2012-01-01',
      :zero_pt => 'true',
      :zero_pension => 'true',
      :vol_pf => 'true',
      :vol_pf_percentage => nil,
      :vol_pf_amount => '3500.00'}
  end

  describe "GET new" do
    it "assigns a new employee_statutory as @employee_statutory" do
      get :new, {:employee_id => @employee.id}
      assigns(:employee_statutory).should be_a_new(EmployeeStatutory)
    end
  end

  describe "GET edit" do
    it "assigns the requested employee_statutory as @employee_statutory" do
      employee_statutory = EmployeeStatutory.create! valid_attributes
      get :edit, {:id => employee_statutory.to_param,:employee_id => @employee.id,:panoption => ''}
      assigns(:employee_statutory).should eq(employee_statutory)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new EmployeeStatutory" do
        expect {
          post :create, {:employee_statutory => valid_attributes}
        }.to change(EmployeeStatutory, :count).by(1)
      end

      it "assigns a newly created employee_statutory as @employee_statutory" do
        post :create, {:employee_statutory => valid_attributes}
        assigns(:employee_statutory).should be_a(EmployeeStatutory)
        assigns(:employee_statutory).should be_persisted
      end

      it "redirects to the created employee_statutory" do
        post :create, {:employee_statutory => valid_attributes}
        response.should redirect_to(employee_url(:id => @employee.id ))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved employee_statutory as @employee_statutory" do
        # Trigger the behavior that occurs when invalid params are submitted
        EmployeeStatutory.any_instance.stub(:save).and_return(false)
        post :create, {:employee_statutory => {}}
        assigns(:employee_statutory).should be_a_new(EmployeeStatutory)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        EmployeeStatutory.any_instance.stub(:save).and_return(false)
        post :create, {:employee_statutory => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested employee_statutory with volunteer pf as amount" do
        employee_statutory = EmployeeStatutory.create! valid_attributes
        EmployeeStatutory.any_instance.should_receive(:update_attributes).with({'these' => 'params',"vol_pf_amount"=>nil, "vol_pf_percentage"=>nil, "based_on"=>nil})
        put :update, {:id => employee_statutory.to_param, :employee_statutory => {'these' => 'params',"vol_pf_amount"=>nil, "vol_pf_percentage"=>nil}}
      end

      it "updates the requested employee_statutory with volunteer pf as percentage" do
        employee_statutory = EmployeeStatutory.create! valid_attributes.merge(:vol_pf_percentage => '5',:vol_pf_amount => nil)
        EmployeeStatutory.any_instance.should_receive(:update_attributes).with({'these' => 'params',"vol_pf_amount"=>nil, "vol_pf_percentage"=>nil, "based_on"=>nil})
        put :update, {:id => employee_statutory.to_param, :employee_statutory => {'these' => 'params',"vol_pf_amount"=>nil, "vol_pf_percentage"=>nil},:chk_vol_pf_pertg=>'true'}
      end

      it "assigns the requested employee_statutory as @employee_statutory" do
        employee_statutory = EmployeeStatutory.create! valid_attributes
        put :update, {:id => employee_statutory.to_param, :employee_statutory => valid_attributes}
        assigns(:employee_statutory).should eq(employee_statutory)
      end

      it "redirects to the employee_statutory" do
        employee_statutory = EmployeeStatutory.create! valid_attributes
        put :update, {:id => employee_statutory.to_param, :employee_statutory => valid_attributes}
        response.should redirect_to(employee_url(:id => @employee.id ))
      end
    end

    describe "with invalid params" do
      it "assigns the employee_statutory as @employee_statutory" do
        employee_statutory = EmployeeStatutory.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EmployeeStatutory.any_instance.stub(:save).and_return(false)
        put :update, {:id => employee_statutory.to_param, :employee_statutory => {}}
        assigns(:employee_statutory).should eq(employee_statutory)
      end

      it "re-renders the 'edit' template" do
        employee_statutory = EmployeeStatutory.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EmployeeStatutory.any_instance.stub(:save).and_return(false)
        put :update, {:id => employee_statutory.to_param, :employee_statutory => {}}
        response.should render_template("edit")
      end
    end
  end



end
