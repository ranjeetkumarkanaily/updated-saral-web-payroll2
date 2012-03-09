require 'spec_helper'

describe HrCategoryDetailsController do
  before :each do
    controller.stub(:logged_in?).and_return(true)
    @hr_category = FactoryGirl.create(:hr_category)
  end

  def valid_attributes
    {
        :hr_category_id => @hr_category.id,
        :name => "Age",
        :data_type => "String",
        :required => true
    }
  end
  describe "GET index" do
    it "assigns all hr_category_details as @hr_category_details" do
      category_detail = HrCategoryDetail.create! valid_attributes
      get :index, :param1 => category_detail.hr_category_id
      assigns(:hr_category_details).should eq([category_detail])
    end
  end

  describe "GET show" do
    it "assigns the requested hr_category_details as @hr_category_details" do
      category_detail = HrCategoryDetail.create! valid_attributes
      get :show, :id => category_detail.id
      assigns(:hr_category_detail).should eq(category_detail)
    end
  end

  describe "GET new" do
    it "assigns a new hr_category_details as @hr_category_details" do
      get :new
      assigns(:hr_category_detail).should be_a_new(HrCategoryDetail)
    end
  end

  describe "GET edit" do
    it "assigns the requested hr_category_details as @hr_category_details" do
      category_detail = HrCategoryDetail.create! valid_attributes
      get :edit, :id => category_detail.id
      assigns(:hr_category_detail).should eq(category_detail)
    end

    it "assigns the requested hr_category_details as @hr_category_details" do
      category_detail = HrCategoryDetail.create! valid_attributes
      get :edit, :id => category_detail.id, :param1 => category_detail.hr_category_id
      assigns(:hr_category_detail).should eq(category_detail)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new HrCategoryDetail" do
        expect {
          post :create, :hr_category_detail => valid_attributes
        }.to change(HrCategoryDetail, :count).by(1)
      end
      it "assigns a newly created HrCategoryDetail as @HrCategoryDetail" do
        post :create, :hr_category_detail => valid_attributes
        assigns(:hr_category_detail).should be_a(HrCategoryDetail)
        assigns(:hr_category_detail).should be_persisted
      end

      it "redirects to the created HrCategoryDetail" do
        post :create, :hr_category_detail => valid_attributes
        response.should redirect_to hr_category_details_path(:param1 => valid_attributes[:hr_category_id])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved HrCategoryDetail as @HrCategoryDetail" do
        # Trigger the behavior that occurs when invalid params are submitted
        HrCategoryDetail.any_instance.stub(:save).and_return(false)
        post :create, :hr_category_detail => {}
        assigns(:hr_category_detail).should be_a_new(HrCategoryDetail)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        HrCategoryDetail.any_instance.stub(:save).and_return(false)
        post :create, :hr_category_detail => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested hr_category_detail" do
        category_detail = HrCategoryDetail.create! valid_attributes
        HrCategoryDetail.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => category_detail.id, :hr_category_detail => {'these' => 'params'}
      end

      it "assigns the requested hr_category_detail as @hr_category_detail" do
        category_detail = HrCategoryDetail.create! valid_attributes
        put :update, {:id => category_detail.id, :hr_category_detail => valid_attributes}
        assigns(:hr_category_detail).should eq(category_detail)
      end

      it "redirects to the hr_category_detail" do
        category_detail = HrCategoryDetail.create! valid_attributes
        put :update, :id => category_detail.id, :hr_category_detail => valid_attributes
        response.should redirect_to(hr_category_details_path(:param1 => valid_attributes[:hr_category_id]))
      end
    end

    describe "with invalid params" do
      it "assigns the hr_category_detail as @hr_category_detail" do
        category_detail = HrCategoryDetail.create! valid_attributes
        HrCategoryDetail.any_instance.stub(:save).and_return(false)
        put :update, :id => category_detail.id, :employee_detail => {}
        assigns(:hr_category_detail).should eq(category_detail)
      end

      it "re-renders the 'edit' template" do
        category_detail = HrCategoryDetail.create! valid_attributes
        HrCategoryDetail.any_instance.stub(:save).and_return(false)
        put :update, :id => category_detail.id, :employee_detail => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested hr_category_detail" do
      category_detail = HrCategoryDetail.create! valid_attributes
      expect {
        delete :destroy, :id => category_detail.id
      }.to change(HrCategoryDetail, :count).by(-1)
    end

    it "redirects to the employee_details list" do
      category_detail = HrCategoryDetail.create! valid_attributes
      delete :destroy, :id => category_detail.id
      response.should redirect_to(hr_category_details_url(:param1 => valid_attributes[:employee_id] ))
    end
  end

end