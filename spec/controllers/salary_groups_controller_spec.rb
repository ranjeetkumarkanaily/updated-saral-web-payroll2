require 'spec_helper'


describe SalaryGroupsController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  def valid_attributes
    {
        :salary_group_name => "HrDetail",
        :based_on_gross => false
    }
  end

  after(:each) do
    #SalaryGroup.destroy_all
  end

  describe "GET index" do
    it "assigns all salary_groups as @salary_groups" do
      salary_group = SalaryGroup.create! valid_attributes
      get :index
      assigns(:salary_groups).should eq([salary_group])
    end
  end

  describe "GET new" do
    it "assigns a new salary_group as @salary_group" do
      get :new
      assigns(:salary_group).should be_a_new(SalaryGroup)
    end
  end

  describe "GET edit" do
    it "assigns the requested salary_group as @salary_group" do
      salary_group = SalaryGroup.create! valid_attributes
      get :edit, :id => salary_group.id
      assigns(:salary_group).should eq(salary_group)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SalaryGroup" do
        expect {
          post :create, :salary_group => valid_attributes
        }.to change(SalaryGroup, :count).by(1)
      end

      it "assigns a newly created salary_group as @salary_group" do
        post :create, :salary_group => valid_attributes
        assigns(:salary_group).should be_a(SalaryGroup)
        assigns(:salary_group).should be_persisted
      end

      it "redirects to the created salary_group" do
        post :create, :salary_group => valid_attributes
        response.should redirect_to(salary_groups_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved salary_group as @salary_group" do
        # Trigger the behavior that occurs when invalid params are submitted
        SalaryGroup.any_instance.stub(:save).and_return(false)
        post :create, :salary_group => {}
        assigns(:salary_group).should be_a_new(SalaryGroup)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SalaryGroup.any_instance.stub(:save).and_return(false)
        post :create, :salary_group => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested salary_group" do
        salary_group = SalaryGroup.create! valid_attributes
        # Assuming there are no other salary_groups in the database, this
        # specifies that the SalaryGroup created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SalaryGroup.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => salary_group.id, :salary_group => {'these' => 'params'}
      end

      it "assigns the requested salary_group as @salary_group" do
        salary_group = SalaryGroup.create! valid_attributes
        put :update, :id => salary_group.id, :salary_group => valid_attributes
        assigns(:salary_group).should eq(salary_group)
      end

      it "redirects to the salary_group" do
        salary_group = SalaryGroup.create! valid_attributes
        put :update, :id => salary_group.id, :salary_group => valid_attributes
        response.should redirect_to(salary_groups_url)
      end
    end

    describe "with invalid params" do
      it "assigns the salary_group as @salary_group" do
        salary_group = SalaryGroup.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SalaryGroup.any_instance.stub(:save).and_return(false)
        put :update, :id => salary_group.id, :salary_group => {}
        assigns(:salary_group).should eq(salary_group)
      end

      it "re-renders the 'edit' template" do
        salary_group = SalaryGroup.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SalaryGroup.any_instance.stub(:save).and_return(false)
        put :update, :id => salary_group.id, :salary_group => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested salary_group" do
      salary_group = SalaryGroup.create! valid_attributes
      expect {
        delete :destroy, :id => salary_group.id
      }.to change(SalaryGroup, :count).by(-1)
    end

    it "redirects to the salary_groups list" do
      salary_group = SalaryGroup.create! valid_attributes
      delete :destroy, :id => salary_group.id
      response.should redirect_to(salary_groups_url)
    end

    it "does not allow to delete records" do
      salary_group = FactoryGirl.create(:salary_group)
      sal_head = FactoryGirl.create(:salary_head)
      sal_grp_det = FactoryGirl.create(:salary_group_detail, :salary_group_id => salary_group.id, :salary_head_id => sal_head.id)
      emp = FactoryGirl.create(:employee)
      fin_inst = FactoryGirl.create(:financial_institution)
      branch = FactoryGirl.create(:branch)
      attn_config = FactoryGirl.create(:attendance_configuration)
      emp_det = FactoryGirl.create(:employee_detail, :employee_id => emp.id, :salary_group_id => salary_group.id, :branch_id => branch.id, :financial_institution_id => fin_inst.id, :attendance_configuration_id => attn_config.id)

      delete :destroy, :id => salary_group.id
      assigns(:salary_group).errors.size.should == 1
    end

  end

end
