require 'spec_helper'


describe EsiGroupsController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  def valid_attributes
    {
        :esi_group_name => "ESI Group Name",
        :address => "ESI ADDRESS",
        :esi_no => "ESI NUMBER",
        :esi_local_office => "ESI Local Office"
    }
  end

  describe "GET index" do
    it "assigns all esi_groups as @esi_groups" do
      esi_group = EsiGroup.create! valid_attributes
      get :index
      assigns(:esi_groups).should eq([esi_group])
    end
  end

  describe "GET new" do
    it "assigns a new esi_group as @esi_group" do
      get :new
      assigns(:esi_group).should be_a_new(EsiGroup)
    end
  end

  describe "GET edit" do
    it "assigns the requested esi_group as @esi_group" do
      esi_group = EsiGroup.create! valid_attributes
      get :edit, {:id => esi_group.to_param}
      assigns(:esi_group).should eq(esi_group)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new EsiGroup" do
        expect {
          post :create, {:esi_group => valid_attributes}
        }.to change(EsiGroup, :count).by(1)
      end

      it "assigns a newly created esi_group as @esi_group" do
        post :create, {:esi_group => valid_attributes}
        assigns(:esi_group).should be_a(EsiGroup)
        assigns(:esi_group).should be_persisted
      end

      it "redirects to the created esi_group" do
        post :create, {:esi_group => valid_attributes}
        response.should redirect_to(esi_groups_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved esi_group as @esi_group" do
        # Trigger the behavior that occurs when invalid params are submitted
        EsiGroup.any_instance.stub(:save).and_return(false)
        post :create, {:esi_group => {}}
        assigns(:esi_group).should be_a_new(EsiGroup)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        EsiGroup.any_instance.stub(:save).and_return(false)
        post :create, {:esi_group => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested esi_group" do
        esi_group = EsiGroup.create! valid_attributes
        EsiGroup.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => esi_group.to_param, :esi_group => {'these' => 'params'}}
      end

      it "assigns the requested esi_group as @esi_group" do
        esi_group = EsiGroup.create! valid_attributes
        put :update, {:id => esi_group.to_param, :esi_group => valid_attributes}
        assigns(:esi_group).should eq(esi_group)
      end

      it "redirects to the esi_group" do
        esi_group = EsiGroup.create! valid_attributes
        put :update, {:id => esi_group.to_param, :esi_group => valid_attributes}
        response.should redirect_to(esi_groups_url)
      end
    end

    describe "with invalid params" do
      it "assigns the esi_group as @esi_group" do
        esi_group = EsiGroup.create! valid_attributes
        EsiGroup.any_instance.stub(:save).and_return(false)
        put :update, {:id => esi_group.to_param, :esi_group => {}}
        assigns(:esi_group).should eq(esi_group)
      end

      it "re-renders the 'edit' template" do
        esi_group = EsiGroup.create! valid_attributes
        EsiGroup.any_instance.stub(:save).and_return(false)
        put :update, {:id => esi_group.to_param, :esi_group => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested esi_group" do
      esi_group = EsiGroup.create! valid_attributes
      expect {
        delete :destroy, {:id => esi_group.to_param}
      }.to change(EsiGroup, :count).by(-1)
    end

    it "redirects to the esi_groups list" do
      esi_group = EsiGroup.create! valid_attributes
      delete :destroy, {:id => esi_group.to_param}
      response.should redirect_to(esi_groups_url)
    end

    it "does not allow to delete" do
      esi_grp = FactoryGirl.create(:esi_group)
      banch = FactoryGirl.create(:branch, :esi_group_id => esi_grp.id)
      delete :destroy, :id => esi_grp.id
      assigns(:esi_group).errors.size.should == 1
    end
  end

end
