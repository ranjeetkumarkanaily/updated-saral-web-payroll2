require 'spec_helper'

describe EsiDetailsController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
    @date_format = FactoryGirl.create(:date_format)
    @option_setting = FactoryGirl.create(:option_setting)
  end

  def valid_attributes
    {
        #:branch_id => FactoryGirl.create(:branch).id,
        #:pt_group_id => FactoryGirl.create(:pt_group).id,
        :pt_effective_date =>  "2012-01-01"
    }
  end

  def update_valid_attributes
    {
        #:branch_id => FactoryGirl.create(:branch).id,
        #:pt_group_id => FactoryGirl.create(:pt_group).id,
        :pt_effective_date =>  "01/01/2012"
    }
  end

  def valid_session
    {}
  end

  describe "GET new" do
    it "assigns a new esi_detail as @esi_detail" do
      @esi_detail = FactoryGirl.create(:esi_detail)
      get :new, {:branch_id => @esi_detail.branch_id}, valid_session
      assigns(:esi_detail).should be_a_new(EsiDetail)
    end
  end

  describe "GET edit" do
    it "assigns the requested esi_detail as @esi_detail" do
      @esi_detail = FactoryGirl.create(:esi_detail)
      get :edit, {:id => @esi_detail.id, :branch_id => @esi_detail.branch_id}, valid_session
      assigns(:esi_detail).should eq(@esi_detail)
    end
  end

  describe "POST create" do

    before :each do
      @branch = FactoryGirl.create(:branch)
      @esi_group = FactoryGirl.create(:esi_group)
    end


    describe "with valid params" do
      it "creates a new EsiDetail" do
        expect {
          post :create, {:esi_detail => {"branch_id" => @branch.id, "esi_group_id" => @esi_group.id, "esi_effective_date" => "2012-01-01"}, :branch_id => @branch.id}, valid_session
        }.to change(EsiDetail, :count).by(1)

        assigns(:esi_detail).should be_a(EsiDetail)
        assigns(:esi_detail).should be_persisted
        response.should redirect_to(new_branch_esi_detail_path(@branch))
      end
    end

    describe "create with date format of %m/%d/%Y" do
      it "should create employee statutory detail  with converted date format" do
        DateFormat.first.update_attributes(:date_format => "m/d/Y",:date_format_value=>"%m/%d/%Y")
        OptionSetting.first.update_attribute("date_format","m/d/Y")
        expect {
          post :create, {:esi_detail => {"branch_id" => @branch.id, "esi_group_id" => @esi_group.id, "esi_effective_date" => "01/01/2012"}, :branch_id => @branch.id}, valid_session
        }.to change(EsiDetail, :count).by(1)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved esi_detail as @esi_detail" do
        # Trigger the behavior that occurs when invalid params are submitted
        EsiDetail.any_instance.stub(:save).and_return(false)
        post :create, {:esi_detail => {}, :branch_id => @branch.id}, valid_session
        assigns(:esi_detail).should be_a_new(EsiDetail)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        EsiDetail.any_instance.stub(:save).and_return(false)
        post :create, {:esi_detail => {}, :branch_id => @branch.id}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do

    before :each do
      @esi_detail = FactoryGirl.create(:esi_detail)
    end

    describe "with valid params" do
      it "updates the requested esi_detail" do
        EsiDetail.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => @esi_detail.to_param, :branch_id => @esi_detail.branch_id, :esi_detail => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested esi_detail as @esi_detail" do
        put :update, {:id => @esi_detail.to_param, :branch_id => @esi_detail.branch_id, :esi_detail => valid_attributes}, valid_session
        assigns(:esi_detail).should eq(@esi_detail)
      end

      it "redirects to the esi_detail" do
        put :update, {:id => @esi_detail.to_param, :branch_id => @esi_detail.branch_id, :esi_detail => valid_attributes}, valid_session
        response.should redirect_to(new_branch_esi_detail_path(@esi_detail.branch))
      end
    end

    describe "update with date format of %m/%d/%Y" do
      it "should update employee statutory details with converted date format" do
        DateFormat.first.update_attributes(:date_format => "m/d/Y",:date_format_value=>"%m/%d/%Y")
        OptionSetting.first.update_attribute("date_format","m/d/Y")
        put :update, {:id => @esi_detail.to_param, :branch_id => @esi_detail.branch_id, :esi_detail => update_valid_attributes}, valid_session
        assigns(:esi_detail).should eq(@esi_detail)
      end
    end

    describe "with invalid params" do
      it "assigns the esi_detail as @esi_detail" do
        EsiDetail.any_instance.stub(:save).and_return(false)
        put :update, {:id => @esi_detail.to_param, :branch_id => @esi_detail.branch_id, :esi_detail => {}}, valid_session
        assigns(:esi_detail).should eq(@esi_detail)
      end

      it "re-renders the 'edit' template" do
        EsiDetail.any_instance.stub(:save).and_return(false)
        put :update, {:id => @esi_detail.to_param, :branch_id => @esi_detail.branch_id, :esi_detail => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @esi_detail = FactoryGirl.create(:esi_detail)
    end
    it "destroys the requested esi_detail" do
      expect {
        delete :destroy, {:id => @esi_detail.to_param, :branch_id =>  @esi_detail.branch_id}, valid_session
      }.to change(EsiDetail, :count).by(-1)
    end

    it "redirects to the esi_details list" do
      delete :destroy, {:id => @esi_detail.to_param, :branch_id =>  @esi_detail.branch_id}, valid_session
      response.should redirect_to(new_branch_esi_detail_path(@esi_detail.branch))
    end
  end

end