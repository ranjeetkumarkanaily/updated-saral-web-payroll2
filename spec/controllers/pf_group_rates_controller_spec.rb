require 'spec_helper'

describe PfGroupRatesController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
    @pf_group = FactoryGirl.create(:pf_group)
    @paymonth = FactoryGirl.create(:paymonth)

  end

  def valid_attributes
    { :pf_group_id => 1,
      :paymonth_id => 1,
      :account_number_21 => 2,
      :pension_fund => 8,
      :epf => 5,
      :account_number_02 => 3,
      :account_number_22 => 4,
      :round_off => 'higher rupee',
      :restrict_employer_share => true,
      :restrict_employee_share_to_employer_share => true,
      :employer_epf => 1,
      :cutoff => 2,
    }
  end
  
  describe "GET index" do

    it "assigns all pf_group_rates as @pf_group_rates" do

      pf_group_rate = PfGroupRate.create! valid_attributes.merge(:pf_group_id => @pf_group.id, :paymonth_id => @paymonth.id)

      get :index, {:params1 => @pf_group.id}
      assigns(:pf_group_rates).should eq([pf_group_rate])
    end
  end

  describe "GET show" do

    it "assigns the requested pf_group_rate as @pf_group_rate" do
      pf_group_rate = PfGroupRate.create! valid_attributes.merge(:pf_group_id => @pf_group.id, :paymonth_id => @paymonth.id)
      get :show, {:id => pf_group_rate.to_param}
      assigns(:pf_group_rate).should eq(pf_group_rate)
    end
  end

  describe "GET new" do
    it "assigns a new pf_group_rate as @pf_group_rate" do
      get :new
      assigns(:pf_group_rate).should be_a_new(PfGroupRate)
    end
  end

  describe "GET edit" do
    it "assigns the requested pf_group_rate as @pf_group_rate" do
      pf_group_rate = PfGroupRate.create! valid_attributes.merge(:pf_group_id => @pf_group.id, :paymonth_id => @paymonth.id)
      get :edit, {:id => pf_group_rate.to_param}
      assigns(:pf_group_rate).should eq(pf_group_rate)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PfGroupRate" do
        expect {
          post :create, {:pf_group_rate => valid_attributes.merge(:pf_group_id => @pf_group.id, :paymonth_id => @paymonth.id, :effective_date => '2010-12-01')}
        }.to change(PfGroupRate, :count).by(1)
      end

      it "assigns a newly created pf_group_rate as @pf_group_rate" do
        post :create, {:pf_group_rate => valid_attributes.merge(:pf_group_id => @pf_group.id, :paymonth_id => @paymonth.id, :effective_date => '2010-12-01')}
        assigns(:pf_group_rate).should be_a(PfGroupRate)
        assigns(:pf_group_rate).should be_persisted
      end

      it "redirects to the created pf_group_rate" do
        post :create, {:pf_group_rate => valid_attributes.merge(:pf_group_id => @pf_group.id, :paymonth_id => @paymonth.id, :effective_date => '2010-12-01')}
        response.should redirect_to(pf_group_rates_url(:params1 => @pf_group.id))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pf_group_rate as @pf_group_rate" do
        # Trigger the behavior that occurs when invalid params are submitted
        PfGroupRate.any_instance.stub(:save).and_return(false)
        post :create, {:pf_group_rate => {:paymonth_id => @paymonth.id}}
        assigns(:pf_group_rate).should be_a_new(PfGroupRate)
      end

      it "re-renders the 'new' template" do
        PfGroupRate.any_instance.stub(:save).and_return(false)
        post :create, {:pf_group_rate => {:paymonth_id => @paymonth.id}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested pf_group_rate" do
        pf_group_rate = PfGroupRate.create! valid_attributes.merge(:pf_group_id => @pf_group.id, :paymonth_id => @paymonth.id)
        PfGroupRate.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => pf_group_rate.to_param, :pf_group_rate => {'these' => 'params'}}
      end

      it "assigns the requested pf_group_rate as @pf_group_rate" do
        pf_group_rate = PfGroupRate.create! valid_attributes.merge(:pf_group_id => @pf_group.id, :paymonth_id => @paymonth.id)
        put :update, {:id => pf_group_rate.to_param, :pf_group_rate => valid_attributes.merge(:pf_group_id => @pf_group.id, :paymonth_id => @paymonth.id)}
        assigns(:pf_group_rate).should eq(pf_group_rate)
      end

      it "redirects to the pf_group_rate" do
        pf_group_rate = PfGroupRate.create! valid_attributes.merge(:pf_group_id => @pf_group.id, :paymonth_id => @paymonth.id)
        put :update, {:id => pf_group_rate.to_param, :pf_group_rate => valid_attributes.merge(:pf_group_id => @pf_group.id, :paymonth_id => @paymonth.id)}
        response.should redirect_to(pf_group_rates_url(:params1 => @pf_group.id))
      end
    end


    describe "with invalid params" do
      it "assigns the pf_group_rate as @pf_group_rate" do
        pf_group_rate = PfGroupRate.create! valid_attributes.merge(:pf_group_id => @pf_group.id, :paymonth_id => @paymonth.id)
        # Trigger the behavior that occurs when invalid params are submitted
        PfGroupRate.any_instance.stub(:save).and_return(false)
        put :update, {:id => pf_group_rate.to_param, :pf_group_rate => {}}
        assigns(:pf_group_rate).should eq(pf_group_rate)
      end

      it "re-renders the 'edit' template" do
        pf_group_rate = PfGroupRate.create! valid_attributes.merge(:pf_group_id => @pf_group.id, :paymonth_id => @paymonth.id)
        # Trigger the behavior that occurs when invalid params are submitted
        PfGroupRate.any_instance.stub(:save).and_return(false)
        put :update, {:id => pf_group_rate.to_param, :pf_group_rate => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested pf_group_rate" do
      pf_group_rate = PfGroupRate.create! valid_attributes.merge(:pf_group_id => @pf_group.id, :paymonth_id => @paymonth.id)
      expect {
        delete :destroy, {:id => pf_group_rate.to_param}
      }.to change(PfGroupRate, :count).by(-1)
    end

    it "redirects to the pf_group_rates list" do
      pf_group_rate = PfGroupRate.create! valid_attributes.merge(:pf_group_id => @pf_group.id, :paymonth_id => @paymonth.id)
      delete :destroy, {:id => pf_group_rate.to_param}
      response.should redirect_to(pf_group_rates_url(:params1 => @pf_group.id))
    end
  end

end
