require 'spec_helper'


describe SalaryGroupDetailsController do
  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  def valid_attributes
    {:calc_type => "Lumpsum",
     :calculation => "",
     :based_on => "Present Days",
     :salary_group_id => "1",
     :salary_head_id=>"1"}
  end

  describe "GET index" do
    it "assigns all employee_details as @salary_group_details" do
      salary_group_detail = SalaryGroupDetail.create! valid_attributes
      get :index
      assigns(:salary_group_details).should eq([salary_group_detail])
    end

    it "assigns all salary_group_details of specific as @salary_group_details" do
      salary_group_detail = SalaryGroupDetail.create! valid_attributes
      get :index, :param1 => 1
      assigns(:salary_group_details).should eq([salary_group_detail])
    end
  end

  describe "GET show" do
    it "assigns the requested salary_group_detail as @salary_group_detail" do
      salary_group_detail = SalaryGroupDetail.create! valid_attributes
      get :show, :id => salary_group_detail.id
      assigns(:salary_group_detail).should eq(salary_group_detail)
    end
  end

  describe "GET new" do
    it "assigns a new salary_group_detail as @salary_group_detail" do
      get :new
      assigns(:salary_group_detail).should be_a_new(SalaryGroupDetail)
    end
  end

  describe "GET edit" do
    it "assigns the requested salary_group_detail as @salary_group_detail" do
      salary_group_detail = SalaryGroupDetail.create! valid_attributes
      get :edit, :id => salary_group_detail.id
      assigns(:salary_group_detail).should eq(salary_group_detail)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SalaryGroupDetail" do
        expect {
          post :create, :salary_group_detail => valid_attributes
        }.to change(SalaryGroupDetail, :count).by(1)
      end

      it "assigns a newly created salary_group_detail as @salary_group_detail" do
        post :create, :salary_group_detail => valid_attributes
        assigns(:salary_group_detail).should be_a(SalaryGroupDetail)
        assigns(:salary_group_detail).should be_persisted
      end

      it "redirects to the created salary_group_detail" do
        post :create, :salary_group_detail => valid_attributes
        response.should redirect_to(salary_group_details_path(:param1 => valid_attributes[:salary_group_id]))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved salary_group_detail as @salary_group_detail" do
        # Trigger the behavior that occurs when invalid params are submitted
        SalaryGroupDetail.any_instance.stub(:save).and_return(false)
        post :create, :salary_group_detail => {}
        assigns(:salary_group_detail).should be_a_new(SalaryGroupDetail)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SalaryGroupDetail.any_instance.stub(:save).and_return(false)
        post :create, :salary_group_detail => valid_attributes
        response.should redirect_to(new_salary_group_detail_path(:param1 => valid_attributes[:salary_group_id]))
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested salary_group_detail" do
        salary_group_detail = SalaryGroupDetail.create! valid_attributes
        SalaryGroupDetail.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => salary_group_detail.id, :salary_group_detail => {'these' => 'params'}
      end

      it "assigns the requested salary_group_detail as @salary_group_detail" do
        salary_group_detail = SalaryGroupDetail.create! valid_attributes
        put :update, :id => salary_group_detail.id, :salary_group_detail => valid_attributes
        assigns(:salary_group_detail).should eq(salary_group_detail)
      end

      it "redirects to the salary_group_detail" do
        salary_group_detail = SalaryGroupDetail.create! valid_attributes
        put :update, :id => salary_group_detail.id, :salary_group_detail => valid_attributes
        response.should redirect_to(salary_group_details_path(:param1 => valid_attributes[:salary_group_id]))
      end
    end

    describe "with invalid params" do
      it "assigns the salary_group_detail as @salary_group_detail" do
        salary_group_detail = SalaryGroupDetail.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SalaryGroupDetail.any_instance.stub(:save).and_return(false)
        put :update, :id => salary_group_detail.id, :salary_group_detail => {}
        assigns(:salary_group_detail).should eq(salary_group_detail)
      end

      it "re-renders the 'edit' template" do
        salary_group_detail = SalaryGroupDetail.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SalaryGroupDetail.any_instance.stub(:save).and_return(false)
        put :update, :id => salary_group_detail.id, :salary_group_detail => valid_attributes
        response.should redirect_to(edit_salary_group_detail_path(:param1 => valid_attributes[:salary_group_id]))
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested salary_group_detail" do
      salary_group_detail = SalaryGroupDetail.create! valid_attributes
      expect {
        delete :destroy, :id => salary_group_detail.id
      }.to change(SalaryGroupDetail, :count).by(-1)
    end

    it "redirects to the salary_group_details list" do
      salary_group_detail = SalaryGroupDetail.create! valid_attributes
      delete :destroy, :id => salary_group_detail.id
      response.should redirect_to(salary_group_details_path)
    end
  end

end
