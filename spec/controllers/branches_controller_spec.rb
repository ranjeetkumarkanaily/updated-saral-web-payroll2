require 'spec_helper'

describe BranchesController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
    @pf_group = FactoryGirl.create(:pf_group)
    @pt_group = FactoryGirl.create(:pt_group)
    @esi_group = FactoryGirl.create(:esi_group)

  end

  def valid_attributes
    {
        :branch_name => "Karnataka",
        :responsible_person => "Sunil",
        :address => "12 Street",
        :pf_group_id => @pf_group.id,
        :pt_group_id => @pt_group.id,
        :esi_group_id => @esi_group.id}
  end

  describe "GET index" do
    it "assigns all branches as @branches" do
      branch = Branch.create! valid_attributes
      get :index
      assigns(:branches).should eq([branch])
    end
  end

  describe "GET show" do
    it "assigns the requested branch as @branch" do
      branch = Branch.create! valid_attributes
      get :show, {:id => branch.to_param}
      assigns(:branch).should eq(branch)
    end
  end

  describe "GET new" do
    it "assigns a new branch as @branch" do
      get :new
      assigns(:branch).should be_a_new(Branch)
    end
  end

  describe "GET edit" do
    it "assigns the requested branch as @branch" do
      branch = Branch.create! valid_attributes
      get :edit, {:id => branch.to_param}
      assigns(:branch).should eq(branch)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Branch" do
        expect {
          post :create, {:branch => valid_attributes}
        }.to change(Branch, :count).by(1)
      end

      it "assigns a newly created branch as @branch" do
        post :create, {:branch => valid_attributes}
        assigns(:branch).should be_a(Branch)
        assigns(:branch).should be_persisted
      end

      it "redirects to the created branch" do
        post :create, {:branch => valid_attributes}
        response.should redirect_to(Branch.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved branch as @branch" do
        # Trigger the behavior that occurs when invalid params are submitted
        Branch.any_instance.stub(:save).and_return(false)
        post :create, {:branch => {}}
        assigns(:branch).should be_a_new(Branch)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Branch.any_instance.stub(:save).and_return(false)
        post :create, {:branch => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested branch" do
        branch = Branch.create! valid_attributes
        Branch.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => branch.to_param, :branch => {'these' => 'params'}}
      end

      it "assigns the requested branch as @branch" do
        branch = Branch.create! valid_attributes
        put :update, {:id => branch.to_param, :branch => valid_attributes}
        assigns(:branch).should eq(branch)
      end

      it "redirects to the branch" do
        branch = Branch.create! valid_attributes
        put :update, {:id => branch.to_param, :branch => valid_attributes}
        response.should redirect_to(branch)
      end
    end

    describe "with invalid params" do
      it "assigns the branch as @branch" do
        branch = Branch.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Branch.any_instance.stub(:save).and_return(false)
        put :update, {:id => branch.to_param, :branch => {}}
        assigns(:branch).should eq(branch)
      end

      it "re-renders the 'edit' template" do
        branch = Branch.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Branch.any_instance.stub(:save).and_return(false)
        put :update, {:id => branch.to_param, :branch => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested branch" do
      branch = Branch.create! valid_attributes
      expect {
        delete :destroy, {:id => branch.to_param}
      }.to change(Branch, :count).by(-1)
    end

    it "redirects to the branches list" do
      branch = Branch.create! valid_attributes
      delete :destroy, {:id => branch.to_param}
      response.should redirect_to(branches_url)
    end
  end

end
