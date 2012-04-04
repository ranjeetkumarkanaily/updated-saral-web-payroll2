require 'spec_helper'


describe PtGroupRatesController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
    @paymonth = FactoryGirl.create(:paymonth)
    @pt_group = FactoryGirl.create(:pt_group)
  end

  def valid_attributes
    {
      :paymonth_id => @paymonth.id,
      :pt_group_id => @pt_group.id
    }
  end

  def valid_session
    {}
  end

  describe "GET new" do
    it "assigns a new pt_group_rate as @pt_group_rate" do
      get :new, {:pt_group_id => valid_attributes[:pt_group_id]}, valid_session
      assigns(:pt_group_rate).should be_a_new(PtGroupRate)

    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PtGroupRate" do
        expect {
          post :create, {:pt_group_rate => valid_attributes}, valid_session
        }.to change(PtGroupRate, :count).by(1)
      end

      it "assigns a newly created pt_group_rate as @pt_group_rate" do
        post :create, {:pt_group_rate => valid_attributes}, valid_session
        assigns(:pt_group_rate).should be_a(PtGroupRate)
        assigns(:pt_group_rate).should be_persisted
      end

      it "redirects to the created pt_group_rate" do
        post :create, {:pt_group_rate => valid_attributes}, valid_session
        response.should redirect_to(pt_group_path(:id => valid_attributes[:pt_group_id]))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pt_group_rate as @pt_group_rate" do
        # Trigger the behavior that occurs when invalid params are submitted
        PtGroupRate.any_instance.stub(:save).and_return(false)
        post :create, {:pt_group_rate => {}}, valid_session
        assigns(:pt_group_rate).should be_a_new(PtGroupRate)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PtGroupRate.any_instance.stub(:save).and_return(false)
        post :create, {:pt_group_rate => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

end
