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
     :salary_head_id=>"1",
     :effective_month=>"Jan/2012"}
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
    before :each do
      @employee = FactoryGirl.create(:employee)
      @salary_group = FactoryGirl.create(:salary_group)
      @sal_head = FactoryGirl.create(:salary_head)
      @branch = FactoryGirl.create(:branch)
      @financial_institution = FactoryGirl.create(:financial_institution)
      @attendance_configuration = FactoryGirl.create(:attendance_configuration)
      @salary_group_detail = FactoryGirl.create(:salary_group_detail, :salary_group_id => @salary_group.id, :salary_head_id => @sal_head.id)
      @employee_detail = FactoryGirl.create(:employee_detail, :employee_id => @employee.id, :salary_group_id => @salary_group.id, :branch_id => @branch.id, :financial_institution_id => @financial_institution.id, :attendance_configuration_id => @attendance_configuration.id)

      def val_attr
        {
            :calc_type => "Lumpsum",
            :calculation => "",
            :based_on => "Present Days",
            :salary_group_id => @salary_group.id,
            :salary_head_id=>@sal_head.id,
            :effective_month=>"Jan/2012"
        }
      end
    end
    describe "with valid params" do
      it "creates a new SalaryGroupDetail" do
        expect {
          post :create, :salary_group_detail => val_attr
        }.to change(SalaryGroupDetail, :count).by(1)
      end

      it "assigns a newly created salary_group_detail as @salary_group_detail" do

        post :create, :salary_group_detail => val_attr
        assigns(:salary_group_detail).should be_a(SalaryGroupDetail)
        assigns(:salary_group_detail).should be_persisted
      end

      it "redirects to the created salary_group_detail" do
        post :create, :salary_group_detail => val_attr
        response.should redirect_to(salary_group_details_path(:param1 => val_attr[:salary_group_id]))
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
        effective_month_exist = SalaryGroupDetail.chk_effective_month salary_group_detail.effective_month, salary_group_detail.id
        SalaryGroupDetail.any_instance.should_receive(:update_attributes).with(valid_attributes.with_indifferent_access)
        put :update, :id => salary_group_detail.id, :salary_group_detail => valid_attributes
      end

      it "assigns the requested salary_group_detail as @salary_group_detail" do
        salary_group_detail = SalaryGroupDetail.create! valid_attributes
        effective_month_exist = SalaryGroupDetail.chk_effective_month salary_group_detail.effective_month, salary_group_detail.id
        put :update, :id => salary_group_detail.id, :salary_group_detail => valid_attributes
        assigns(:salary_group_detail).should eq(salary_group_detail)
      end

      it "redirects to the salary_group_detail" do
        salary_group_detail = SalaryGroupDetail.create! valid_attributes
        effective_month_exist = SalaryGroupDetail.chk_effective_month salary_group_detail.effective_month, salary_group_detail.id
        put :update, :id => salary_group_detail.id, :salary_group_detail => valid_attributes
        response.should redirect_to(salary_group_details_path(:param1 => valid_attributes[:salary_group_id]))
      end

      it "should create new record" do
        salary_group_detail = SalaryGroupDetail.create! valid_attributes
        expect {
          put :update, :id => salary_group_detail.id, :salary_group_detail => valid_attributes.merge(:effective_month=>"Feb/2012")
        }.to change(SalaryGroupDetail, :count).by(1)
      end

      it "re-renders the 'new' template" do
        salary_group_detail = SalaryGroupDetail.create! valid_attributes
        SalaryGroupDetail.any_instance.stub(:save).and_return(false)
        put :update, :id => salary_group_detail.id, :salary_group_detail => valid_attributes.merge(:effective_month=>"Feb/2012")
        response.should redirect_to(new_salary_group_detail_path(:param1 => valid_attributes[:salary_group_id]))
      end
    end

    describe "with invalid params" do
      it "assigns the salary_group_detail as @salary_group_detail" do
        #salary_group_detail = SalaryGroupDetail.create! valid_attributes
        #effective_month_exist = SalaryGroupDetail.chk_effective_month salary_group_detail.effective_month, salary_group_detail.id
        #SalaryGroupDetail.any_instance.stub(:save).and_return(false)
        #put :update, :id => salary_group_detail.id, :salary_group_detail => {}
        #assigns(:salary_group_detail).should eq(salary_group_detail)
      end

      it "re-renders the 'edit' template" do
        salary_group_detail = SalaryGroupDetail.create! valid_attributes
        effective_month_exist = SalaryGroupDetail.chk_effective_month salary_group_detail.effective_month, salary_group_detail.id
        SalaryGroupDetail.any_instance.stub(:save).and_return(false)
        put :update, :id => salary_group_detail.id, :salary_group_detail => valid_attributes
        response.should redirect_to(edit_salary_group_detail_path(:param1 => valid_attributes[:salary_group_id]))
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @salary_group = FactoryGirl.create(:salary_group)
    end
    it "destroys the requested salary_group_detail" do
      salary_group_detail = FactoryGirl.create(:salary_group_detail,:salary_group_id=>@salary_group.id)
      expect {
        delete :destroy, :id => salary_group_detail.id, :param1=> @salary_group.id
      }.to change(SalaryGroupDetail, :count).by(-1)
    end

    it "redirects to the salary_group_details list" do
      salary_group_detail = FactoryGirl.create(:salary_group_detail,:salary_group_id=>@salary_group.id)
      delete :destroy, :id => salary_group_detail.id, :param1=> @salary_group.id
      response.should redirect_to(salary_group_details_path(:param1 => @salary_group.id))
    end
  end

end
