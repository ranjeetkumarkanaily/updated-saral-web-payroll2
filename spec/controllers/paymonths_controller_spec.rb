require 'spec_helper'

describe PaymonthsController do

  # This should return the minimal set of attributes required to create a valid
  # Paymonth. As you add validations to Paymonth, be sure to
  # update the return value of this method accordingly.
  before :each do
    controller.stub(:logged_in?).and_return(true)
  end
  def valid_attributes
    {
        :month_year => 24144,
        :number_of_days => 31,
        :from_date => "2011-12-01",
        :to_date => "2011-12-31",
        :month_name => "Dec/2011"
    }
  end

  describe "GET index" do
    it "assigns all paymonths as @paymonths" do
      paymonth = Paymonth.create! valid_attributes
      get :index
      assigns(:paymonths).should eq([paymonth])
    end
  end

  describe "GET show" do
    it "assigns the requested paymonth as @paymonth" do
      paymonth = Paymonth.create! valid_attributes
      get :show, :id => paymonth.id
      assigns(:paymonth).should eq(paymonth)
    end
  end

  describe "GET new" do
    it "assigns a new paymonth as @paymonth" do
      get :new
      assigns(:paymonth).should be_a_new(Paymonth)
    end
  end

  describe "GET edit" do
    it "assigns the requested paymonth as @paymonth" do
      paymonth = Paymonth.create! valid_attributes
      get :edit, :id => paymonth.id
      assigns(:paymonth).should eq(paymonth)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Paymonth" do
        expect {
          post :create, "paymonth"=>{"month_name"=>"feb/2011"}
        }.to change(Paymonth, :count).by(1)
      end

      it "assigns a newly created paymonth as @paymonth" do
        post :create, "paymonth"=>{"month_name"=>"feb/2011"}
        assigns(:paymonth).should be_a(Paymonth)
        assigns(:paymonth).should be_persisted
      end

      it "redirects to the created paymonth" do
        post :create, "paymonth"=>{"month_name"=>"feb/2011"}
        response.should redirect_to(Paymonth.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved paymonth as @paymonth" do
        # Trigger the behavior that occurs when invalid params are submitted
        Paymonth.any_instance.stub(:save).and_return(false)
        post :create, "paymonth"=>{"month_name"=>"feb/2011"}
        assigns(:paymonth).should be_a_new(Paymonth)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Paymonth.any_instance.stub(:save).and_return(false)
        post :create, "paymonth"=>{"month_name"=>"feb/2011"}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      xit "updates the requested paymonth" do
        paymonth = Paymonth.create! valid_attributes
        # Assuming there are no other paymonths in the database, this
        # specifies that the Paymonth created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Paymonth.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => paymonth.id, :paymonth => {'these' => 'params'}
      end

      xit "assigns the requested paymonth as @paymonth" do
        paymonth = Paymonth.create! valid_attributes
        put :update, :id => paymonth.id, "paymonth"=>{"month_name"=>"feb/2011"}
        assigns(:paymonth).should eq(paymonth)
      end

      xit "redirects to the paymonth" do
        paymonth = Paymonth.create! valid_attributes
        put :update, :id => paymonth.id, "paymonth"=>{"month_name"=>"feb/2011"}
        response.should redirect_to(paymonth)
      end
    end

    describe "with invalid params" do
      it "assigns the paymonth as @paymonth" do
        paymonth = Paymonth.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Paymonth.any_instance.stub(:save).and_return(false)
        put :update, :id => paymonth.id, :paymonth => {}
        assigns(:paymonth).should eq(paymonth)
      end

      it "re-renders the 'edit' template" do
        paymonth = Paymonth.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Paymonth.any_instance.stub(:save).and_return(false)
        put :update, :id => paymonth.id, :paymonth => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested paymonth" do
      paymonth = Paymonth.create! valid_attributes
      expect {
        delete :destroy, :id => paymonth.id
      }.to change(Paymonth, :count).by(-1)
    end

    it "redirects to the paymonths list" do
      paymonth = Paymonth.create! valid_attributes
      delete :destroy, :id => paymonth.id
      response.should redirect_to(paymonths_url)
    end
  end

end
