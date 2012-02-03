require 'spec_helper'


describe PfGroupsController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  def valid_attributes
    {
        :pf_group => "Karnataka",
        :pf_number => "KN/3434",
        :db_file_code => "DES334",
        :extension => 1,
        :address => "123 Street"
    }
  end

  describe "GET index" do
    it "assigns all pf_groups as @pf_groups" do
      pf_group = PfGroup.create! valid_attributes
      get :index
      assigns(:pf_groups).should eq([pf_group])
    end
  end

  describe "GET show" do
    it "assigns the requested pf_group as @pf_group" do
      pf_group = PfGroup.create! valid_attributes
      get :show, {:id => pf_group.to_param}
      assigns(:pf_group).should eq(pf_group)
    end
  end

  describe "GET new" do
    it "assigns a new pf_group as @pf_group" do
      get :new
      assigns(:pf_group).should be_a_new(PfGroup)
    end
  end

  describe "GET edit" do
    it "assigns the requested pf_group as @pf_group" do
      pf_group = PfGroup.create! valid_attributes
      get :edit, {:id => pf_group.to_param}
      assigns(:pf_group).should eq(pf_group)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PfGroup" do
        expect {
          post :create, {:pf_group => valid_attributes}
        }.to change(PfGroup, :count).by(1)
      end

      it "assigns a newly created pf_group as @pf_group" do
        post :create, {:pf_group => valid_attributes}
        assigns(:pf_group).should be_a(PfGroup)
        assigns(:pf_group).should be_persisted
      end

      it "redirects to the created pf_group" do
        post :create, {:pf_group => valid_attributes}
        response.should redirect_to(PfGroup.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pf_group as @pf_group" do
        # Trigger the behavior that occurs when invalid params are submitted
        PfGroup.any_instance.stub(:save).and_return(false)
        post :create, {:pf_group => {}}
        assigns(:pf_group).should be_a_new(PfGroup)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PfGroup.any_instance.stub(:save).and_return(false)
        post :create, {:pf_group => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested pf_group" do
        pf_group = PfGroup.create! valid_attributes
        PfGroup.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => pf_group.to_param, :pf_group => {'these' => 'params'}}
      end

      it "assigns the requested pf_group as @pf_group" do
        pf_group = PfGroup.create! valid_attributes
        put :update, {:id => pf_group.to_param, :pf_group => valid_attributes}
        assigns(:pf_group).should eq(pf_group)
      end

      it "redirects to the pf_group" do
        pf_group = PfGroup.create! valid_attributes
        put :update, {:id => pf_group.to_param, :pf_group => valid_attributes}
        response.should redirect_to(pf_group)
      end
    end

    describe "with invalid params" do
      it "assigns the pf_group as @pf_group" do
        pf_group = PfGroup.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PfGroup.any_instance.stub(:save).and_return(false)
        put :update, {:id => pf_group.to_param, :pf_group => {}}
        assigns(:pf_group).should eq(pf_group)
      end

      it "re-renders the 'edit' template" do
        pf_group = PfGroup.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PfGroup.any_instance.stub(:save).and_return(false)
        put :update, {:id => pf_group.to_param, :pf_group => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested pf_group" do
      pf_group = PfGroup.create! valid_attributes
      expect {
        delete :destroy, {:id => pf_group.to_param}
      }.to change(PfGroup, :count).by(-1)
    end

    it "redirects to the pf_groups list" do
      pf_group = PfGroup.create! valid_attributes
      delete :destroy, {:id => pf_group.to_param}
      response.should redirect_to(pf_groups_url)
    end
  end

end
