require 'spec_helper'

describe HrCategoriesController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
    #@attendance_configuration = FactoryGirl.create(:attendance_configuration,:id=>1)
  end

  def valid_attributes
  {
    :category_name => "Education Details"
  }
  end

  describe "GET Index" do
     it "assigns all hr categories to @category" do
       category = FactoryGirl.create(:hr_category)
       get :index
       assigns(:hr_categories).should eq([category])
     end
  end

  describe "GET show" do
    it "assigns the requested hr category as @hr_category" do
      category = FactoryGirl.create(:hr_category)
      get :show, {:id => category.id}
      assigns(:hr_category).should eq(category)
    end
  end

  describe "GET new" do
    it "assigns a new HR Category as @hr_category" do
      get :new, {}
      assigns(:hr_category).should be_a_new(HrCategory)
    end
  end

  describe "GET edit" do
    it "assigns the requested HR Category as @hr_category" do
      category = FactoryGirl.create(:hr_category)
      get :edit, {:id => category.id}
      assigns(:hr_category).should eq(category)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "creates a new Hr Category" do
        expect {
          post :create, {:hr_category => valid_attributes}
        }.to change(HrCategory, :count).by(1)
      end

      it "assigns a newly created hr category as @hr_category" do
        post :create, {:hr_category => valid_attributes}
        assigns(:hr_category).should be_a(HrCategory)
        assigns(:hr_category).should be_persisted
      end

      it "redirects to the created hr category" do
        post :create, {:hr_category => valid_attributes}
        response.should redirect_to (hr_categories_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved hr category as @hr_category" do
        # Trigger the behavior that occurs when invalid params are submitted
        HrCategory.any_instance.stub(:save).and_return(false)
        post :create, {:hr_category => {}}
        assigns(:hr_category).should be_a_new(HrCategory)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        HrCategory.any_instance.stub(:save).and_return(false)
        post :create, {:hr_category => {}}
        response.should render_template("new")
      end
    end

    describe "does not create a new Hr Category" do
      it "should not create Hr Category if Category already exists" do
        category = HrCategory.create! valid_attributes
        expect {
          post :create, {:hr_category => valid_attributes}
        }.to change(HrCategory, :count).by(0)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested Hr Category" do
        category = HrCategory.create! valid_attributes
        HrCategory.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => category.to_param, :hr_category => {'these' => 'params'}}
      end

      it "assigns the requested Hr Category as @hr_category" do
        category = HrCategory.create! valid_attributes
        put :update, {:id => category.to_param, :hr_category => valid_attributes}
        assigns(:hr_category).should eq(category)
      end

      it "redirects to the hr category" do
        category = HrCategory.create! valid_attributes
        put :update, {:id => category.to_param, :hr_category => valid_attributes}
        response.should redirect_to (hr_categories_path)
      end
    end

    describe "with invalid params" do
      it "assigns the category as @hr_category" do
        category = HrCategory.create! valid_attributes
        HrCategory.any_instance.stub(:save).and_return(false)
        put :update, {:id => category.to_param, :holiday => {}}
        assigns(:hr_category).should eq(category)
      end

      it "re-renders the 'edit' template" do
        category = HrCategory.create! valid_attributes
        HrCategory.any_instance.stub(:save).and_return(false)
        put :update, {:id => category.to_param, :holiday => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested hr Category" do
      category = HrCategory.create! valid_attributes
      expect {
        delete :destroy, {:id => category.to_param}
      }.to change(HrCategory, :count).by(-1)
    end

    it "redirects to the hr Category list" do
      category = HrCategory.create! valid_attributes
      delete :destroy, {:id => category.to_param}
      response.should redirect_to(hr_categories_url)
    end
  end
end