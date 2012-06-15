require 'spec_helper'

describe HolidaysController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
    @attendance_configuration = FactoryGirl.create(:attendance_configuration,:id=>1)
    @date_format = FactoryGirl.create(:date_format)
    @option_setting = FactoryGirl.create(:option_setting)
  end

  def valid_attributes
    {
        :attendance_configuration_id => @attendance_configuration.id,
        :holiday_date => '2012-01-26',
        :description => 'Republic Day',
        :national_holiday => true
    }
  end

  def update_valid_attributes
    {
        :attendance_configuration_id => @attendance_configuration.id,
        :holiday_date => '01/26/2012',
        :description => 'Republic Day',
        :national_holiday => true
    }
  end

  describe "GET index" do
    it "assigns all holidays as @holidays" do
      holiday = Holiday.create! valid_attributes
      get :index
      assigns(:holidays).should eq([holiday])
    end

    it "search all holiday for selected attendance head" do
      holiday = Holiday.create! valid_attributes
      get :index, :attendance_configuration => 1
      assigns(:holidays).should eq([holiday])
    end
  end

  describe "GET show" do
    it "assigns the requested holiday as @holiday" do
      holiday = Holiday.create! valid_attributes
      get :show, {:id => holiday.to_param}
      assigns(:holiday).should eq(holiday)
    end
  end

  describe "GET new" do
    it "assigns a new holiday as @holiday" do
      get :new, {}
      assigns(:holiday).should be_a_new(Holiday)
    end
  end

  describe "GET edit" do
    it "assigns the requested holiday as @holiday" do
      holiday = Holiday.create! valid_attributes
      get :edit, {:id => holiday.to_param}
      assigns(:holiday).should eq(holiday)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Holiday" do
        expect {
          post :create, {:holiday => valid_attributes}
        }.to change(Holiday, :count).by(1)
      end

      it "assigns a newly created holiday as @holiday" do
        post :create, {:holiday => valid_attributes}
        assigns(:holiday).should be_a(Holiday)
        assigns(:holiday).should be_persisted
      end

      it "redirects to the created holiday" do
        post :create, {:holiday => valid_attributes}
        response.should redirect_to(Holiday.last)
      end
    end

    describe "create with date format of %m/%d/%Y" do
      it "should create employee statutory detail  with converted date format" do
        DateFormat.first.update_attributes(:date_format => "m/d/Y",:date_format_value=>"%m/%d/%Y")
        OptionSetting.first.update_attribute("date_format","m/d/Y")
        expect {
          post :create, {:holiday => update_valid_attributes}
        }.to change(Holiday, :count).by(1)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved holiday as @holiday" do
        # Trigger the behavior that occurs when invalid params are submitted
        Holiday.any_instance.stub(:save).and_return(false)
        post :create, {:holiday => {}}
        assigns(:holiday).should be_a_new(Holiday)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Holiday.any_instance.stub(:save).and_return(false)
        post :create, {:holiday => {}}
        response.should render_template("new")
      end
    end

    describe "does not create a new Holiday" do
      it "should not create Holiday if Holiday already exists" do
        holiday = Holiday.create! valid_attributes
        expect {
          post :create, {:holiday => valid_attributes}
        }.to change(Holiday, :count).by(0)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested holiday" do
        holiday = Holiday.create! valid_attributes
        # Assuming there are no other holidays in the database, this
        # specifies that the Holiday created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Holiday.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => holiday.to_param, :holiday => {'these' => 'params'}}
      end

      it "assigns the requested holiday as @holiday" do
        holiday = Holiday.create! valid_attributes
        put :update, {:id => holiday.to_param, :holiday => valid_attributes}
        assigns(:holiday).should eq(holiday)
      end

      it "redirects to the holiday" do
        holiday = Holiday.create! valid_attributes
        put :update, {:id => holiday.to_param, :holiday => valid_attributes}
        response.should redirect_to(holiday)
      end
    end

    describe "update with date format of %m/%d/%Y" do
      it "should update employee statutory details with converted date format" do
        DateFormat.first.update_attributes(:date_format => "m/d/Y",:date_format_value=>"%m/%d/%Y")
        OptionSetting.first.update_attribute("date_format","m/d/Y")
        holiday = Holiday.create! valid_attributes
        put :update, {:id => holiday.to_param, :holiday => update_valid_attributes}
        assigns(:holiday).should eq(holiday)
      end
    end

    describe "with invalid params" do
      it "assigns the holiday as @holiday" do
        holiday = Holiday.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Holiday.any_instance.stub(:save).and_return(false)
        put :update, {:id => holiday.to_param, :holiday => {}}
        assigns(:holiday).should eq(holiday)
      end

      it "re-renders the 'edit' template" do
        holiday = Holiday.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Holiday.any_instance.stub(:save).and_return(false)
        put :update, {:id => holiday.to_param, :holiday => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested holiday" do
      holiday = Holiday.create! valid_attributes
      expect {
        delete :destroy, {:id => holiday.to_param}
      }.to change(Holiday, :count).by(-1)
    end

    it "redirects to the holidays list" do
      holiday = Holiday.create! valid_attributes
      delete :destroy, {:id => holiday.to_param}
      response.should redirect_to(holidays_url)
    end
  end

end
