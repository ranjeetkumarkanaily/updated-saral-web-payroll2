require 'spec_helper'

describe MonthYearsController do
  before :each do
    controller.stub(:logged_in?).and_return(true)
  end
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all month_years as @month_years" do
      month_year = MonthYear.create! valid_attributes
      get :index
      assigns(:month_years).should eq([month_year])
    end
  end

  describe "GET show" do
    it "assigns the requested month_year as @month_year" do
      month_year = MonthYear.create! valid_attributes
      get :show, :id => month_year.id
      assigns(:month_year).should eq(month_year)
    end
  end

  describe "GET new" do
    it "assigns a new month_year as @month_year" do
      get :new
      assigns(:month_year).should be_a_new(MonthYear)
    end
  end

  describe "GET edit" do
    it "assigns the requested month_year as @month_year" do
      month_year = MonthYear.create! valid_attributes
      get :edit, :id => month_year.id
      assigns(:month_year).should eq(month_year)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new MonthYear" do
        expect {
          post :create, :month_year => valid_attributes
        }.to change(MonthYear, :count).by(1)
      end

      it "assigns a newly created month_year as @month_year" do
        post :create, :month_year => valid_attributes
        assigns(:month_year).should be_a(MonthYear)
        assigns(:month_year).should be_persisted
      end

      it "redirects to the created month_year" do
        post :create, :month_year => valid_attributes
        response.should redirect_to(MonthYear.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved month_year as @month_year" do
        # Trigger the behavior that occurs when invalid params are submitted
        MonthYear.any_instance.stub(:save).and_return(false)
        post :create, :month_year => {}
        assigns(:month_year).should be_a_new(MonthYear)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        MonthYear.any_instance.stub(:save).and_return(false)
        post :create, :month_year => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested month_year" do
        month_year = MonthYear.create! valid_attributes
        # Assuming there are no other month_years in the database, this
        # specifies that the MonthYear created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        MonthYear.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => month_year.id, :month_year => {'these' => 'params'}
      end

      it "assigns the requested month_year as @month_year" do
        month_year = MonthYear.create! valid_attributes
        put :update, :id => month_year.id, :month_year => valid_attributes
        assigns(:month_year).should eq(month_year)
      end

      it "redirects to the month_year" do
        month_year = MonthYear.create! valid_attributes
        put :update, :id => month_year.id, :month_year => valid_attributes
        response.should redirect_to(month_year)
      end
    end

    describe "with invalid params" do
      it "assigns the month_year as @month_year" do
        month_year = MonthYear.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MonthYear.any_instance.stub(:save).and_return(false)
        put :update, :id => month_year.id, :month_year => {}
        assigns(:month_year).should eq(month_year)
      end

      it "re-renders the 'edit' template" do
        month_year = MonthYear.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MonthYear.any_instance.stub(:save).and_return(false)
        put :update, :id => month_year.id, :month_year => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested month_year" do
      month_year = MonthYear.create! valid_attributes
      expect {
        delete :destroy, :id => month_year.id
      }.to change(MonthYear, :count).by(-1)
    end

    it "redirects to the month_years list" do
      month_year = MonthYear.create! valid_attributes
      delete :destroy, :id => month_year.id
      response.should redirect_to(month_years_url)
    end
  end

end
