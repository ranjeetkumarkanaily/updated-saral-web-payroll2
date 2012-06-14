require 'spec_helper'

describe PfDetailsController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
    @date_format = FactoryGirl.create(:date_format)
    @option_setting = FactoryGirl.create(:option_setting)
  end

  def valid_attributes
    {
        #:branch_id => FactoryGirl.create(:branch).id,
        #:pf_group_id => FactoryGirl.create(:pf_group).id,
        :pf_effective_date =>  "2012-01-01"
    }
  end

  def update_valid_attributes
  {
      #:branch_id => FactoryGirl.create(:branch).id,
      #:pf_group_id => FactoryGirl.create(:pf_group).id,
      :pf_effective_date =>  "01/01/2012"
  }
    end
  
  def valid_session
    {}
  end

  describe "GET new" do
    it "assigns a new pf_detail as @pf_detail" do
      @pf_detail = FactoryGirl.create(:pf_detail)
      get :new, {:branch_id => @pf_detail.branch_id}, valid_session
      assigns(:pf_detail).should be_a_new(PfDetail)
    end
  end

  describe "GET edit" do
    it "assigns the requested pf_detail as @pf_detail" do
      @pf_detail = FactoryGirl.create(:pf_detail)
      get :edit, {:id => @pf_detail.id}, valid_session
      assigns(:pf_detail).should eq(@pf_detail)
    end
  end

  describe "POST create" do

    before :each do
      @branch = FactoryGirl.create(:branch)
      @pf_group = FactoryGirl.create(:pf_group)
    end


    describe "with valid params" do
      it "creates a new PfDetail" do
        expect {
          post :create, {:pf_detail => {"branch_id" => @branch.id, "pf_group_id" => @pf_group.id, "pf_effective_date" => "2012-01-01"}, :branch_id => @branch.id}, valid_session
        }.to change(PfDetail, :count).by(1)

        assigns(:pf_detail).should be_a(PfDetail)
        assigns(:pf_detail).should be_persisted
        response.should redirect_to(new_branch_pf_detail_path(@branch))
      end
    end

    describe "create with date format of %m/%d/%Y" do
      it "should create employee statutory detail  with converted date format" do
        DateFormat.first.update_attributes(:date_format => "m/d/Y",:date_format_value=>"%m/%d/%Y")
        OptionSetting.first.update_attribute("date_format","m/d/Y")
        expect {
          post :create, {:pf_detail => {"branch_id" => @branch.id, "pf_group_id" => @pf_group.id, "pf_effective_date" => "01/01/2012"}, :branch_id => @branch.id}, valid_session
        }.to change(PfDetail, :count).by(1)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pf_detail as @pf_detail" do
        # Trigger the behavior that occurs when invalid params are submitted
        PfDetail.any_instance.stub(:save).and_return(false)
        post :create, {:pf_detail => {}, :branch_id => @branch.id}, valid_session
        assigns(:pf_detail).should be_a_new(PfDetail)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PfDetail.any_instance.stub(:save).and_return(false)
        post :create, {:pf_detail => {}, :branch_id => @branch.id}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    before :each do
      @pf_detail = FactoryGirl.create(:pf_detail)
    end

    describe "with valid params" do
      it "updates the requested pf_detail" do
        PfDetail.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => @pf_detail.to_param, :pf_detail => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested pf_detail as @pf_detail" do
        put :update, {:id => @pf_detail.to_param, :pf_detail => valid_attributes}, valid_session
        assigns(:pf_detail).should eq(@pf_detail)
      end

      it "redirects to the pf_detail" do
        put :update, {:id => @pf_detail.to_param, :pf_detail => valid_attributes}, valid_session
        response.should redirect_to(new_branch_pf_detail_path(@pf_detail.branch))
      end
    end

    describe "update with date format of %m/%d/%Y" do
      it "should update employee statutory details with converted date format" do
        DateFormat.first.update_attributes(:date_format => "m/d/Y",:date_format_value=>"%m/%d/%Y")
        OptionSetting.first.update_attribute("date_format","m/d/Y")
        put :update, {:id => @pf_detail.to_param, :pf_detail => update_valid_attributes}, valid_session
        assigns(:pf_detail).should eq(@pf_detail)
      end
    end

    describe "with invalid params" do
      it "assigns the pf_detail as @pf_detail" do
        PfDetail.any_instance.stub(:save).and_return(false)
        put :update, {:id => @pf_detail.to_param, :pf_detail => {}}, valid_session
        assigns(:pf_detail).should eq(@pf_detail)
      end

      it "re-renders the 'edit' template" do
        PfDetail.any_instance.stub(:save).and_return(false)
        put :update, {:id => @pf_detail.to_param, :pf_detail => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @pf_detail = FactoryGirl.create(:pf_detail)
    end
    it "destroys the requested pf_detail" do
      expect {
        delete :destroy, {:id => @pf_detail.to_param, :branch_id =>  @pf_detail.branch_id}, valid_session
      }.to change(PfDetail, :count).by(-1)
    end

    it "redirects to the pf_details list" do
      delete :destroy, {:id => @pf_detail.to_param, :branch_id =>  @pf_detail.branch_id}, valid_session
      response.should redirect_to(new_branch_pf_detail_path(@pf_detail.branch))
    end
  end

end
