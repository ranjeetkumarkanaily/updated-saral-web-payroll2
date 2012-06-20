require 'spec_helper'

describe HrMastersController do
  before :each do
    controller.stub(:logged_in?).and_return(true)
  end


  describe "GET new" do
    it "assigns a new hr_master as @hr_master" do
      hr_category_details = FactoryGirl.create(:hr_category_detail)
      employee = FactoryGirl.create(:employee)
      get :new, :hr_category_id => hr_category_details.hr_category.id, :employee_id => employee.id
      assigns(:hr_master).should be_a_new(HrMaster)
    end
  end

  describe "GET edit" do
    it "assigns the requested hr_master as @hr_master" do
      hr_master = FactoryGirl.create(:hr_master)
      get :edit, :id => hr_master.id
      assigns(:hr_master).should eq(hr_master)
    end
  end


  describe "POST create" do
    describe "with valid params" do
      before :each do
        @hr_master = FactoryGirl.build(:hr_master)
      end
      it "Count should be increases by one" do
        expect {
          post :create, :hr_master => @hr_master.attributes
        }.to change(HrMaster, :count).by(1)
      end

      it "assigns a newly created hr master as @hr_master" do
        post :create, :hr_master => @hr_master.attributes
        assigns(:hr_master).should be_a(HrMaster)
        assigns(:hr_master).should be_persisted
      end

      it "redirects to the created hr_master" do
        post :create, :hr_master => @hr_master.attributes
        response.should redirect_to(new_hr_master_path(:employee_id => @hr_master.employee_id, :hr_category_id => @hr_master.hr_category_id))
      end

    end

    describe "with invalid params" do
      before :each do
        @hr_master = FactoryGirl.create(:hr_master)
      end
      it "assigns a newly created but unsaved employee as @employee" do
        # Trigger the behavior that occurs when invalid params are submitted
        HrMaster.any_instance.stub(:save).and_return(false)
        post :create, :hr_master => {}
        assigns(:hr_master).should be_a_new(HrMaster)

      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        HrMaster.any_instance.stub(:save).and_return(false)
        post :create, {:hr_master => {}}
        response.should redirect_to(new_hr_master_path(:errors => @hr_master.errors.full_messages))
      end


    end
  end


  describe "PUT update" do
    describe "with valid params" do
      before :each do
        @hr_master = FactoryGirl.create(:hr_master)
      end
      it "updates the requested hr master" do
        HrMaster.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => @hr_master.id, :hr_master => {'these' => 'params'}
      end

      it "assigns the requested employee as @employee" do
        put :update, :id => @hr_master.id, :hr_master => @hr_master.attributes
        assigns(:hr_master).should eq(@hr_master)
      end

      it "redirects to the employee" do
        put :update, :id => @hr_master.id, :hr_master => @hr_master.attributes
        response.should redirect_to(new_hr_master_path(:employee_id => @hr_master.employee_id, :hr_category_id => @hr_master.hr_category_id))
      end
    end

    describe "with invalid params" do
      before :each do
        @hr_master = FactoryGirl.create(:hr_master)
      end
      it "assigns the hr_master as @hr_master" do
        HrMaster.any_instance.stub(:save).and_return(false)
        put :update, :id => @hr_master.id, :hr_master => {}
        assigns(:hr_master).should eq(@hr_master)
      end

      it "re-renders the 'edit' template" do
        HrMaster.any_instance.stub(:save).and_return(false)
        put :update, :id => @hr_master.id, :hr_master => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested Hr Master" do
      hr_master = FactoryGirl.create(:hr_master)
      expect {
        delete :destroy, :id => hr_master.id
      }.to change(HrMaster, :count).by(-1)
    end

    it "redirects to the employees list" do
      hr_master = FactoryGirl.create(:hr_master)
      delete :destroy, :id => hr_master.id
      response.should redirect_to(new_hr_master_path(:employee_id => hr_master.employee_id, :hr_category_id => hr_master.hr_category_id))
    end
  end


end