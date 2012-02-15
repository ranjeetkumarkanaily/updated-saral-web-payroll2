require 'spec_helper'

describe FinancialInstitutionsController do

  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  def valid_attributes
    {
        :name => "State Bank of India",
        :address_line1 => "123 Street",
        :address_line2 => "Mahalakshmipuram",
        :address_line3 => "West of Chord Road",
        :address_line4 => "Bangalore,KArnataka",
        :pincode => "560086",
        :branch_code => "SBI000434",
        :email => "sbi@gmail.com"}
  end

  describe "GET index" do
    it "assigns all financial_institutions as @financial_institutions" do
      financial_institution = FinancialInstitution.create! valid_attributes
      get :index
      assigns(:financial_institutions).should eq([financial_institution])
    end
  end

  describe "GET show" do
    it "assigns the requested financial_institution as @financial_institution" do
      financial_institution = FinancialInstitution.create! valid_attributes
      get :show, {:id => financial_institution.to_param}
      assigns(:financial_institution).should eq(financial_institution)
    end
  end

  describe "GET new" do
    it "assigns a new financial_institution as @financial_institution" do
      get :new
      assigns(:financial_institution).should be_a_new(FinancialInstitution)
    end
  end

  describe "GET edit" do
    it "assigns the requested financial_institution as @financial_institution" do
      financial_institution = FinancialInstitution.create! valid_attributes
      get :edit, {:id => financial_institution.to_param}
      assigns(:financial_institution).should eq(financial_institution)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FinancialInstitution" do
        expect {
          post :create, {:financial_institution => valid_attributes}
        }.to change(FinancialInstitution, :count).by(1)
      end

      it "assigns a newly created financial_institution as @financial_institution" do
        post :create, {:financial_institution => valid_attributes}
        assigns(:financial_institution).should be_a(FinancialInstitution)
        assigns(:financial_institution).should be_persisted
      end

      it "redirects to the created financial_institution" do
        post :create, {:financial_institution => valid_attributes}
        response.should redirect_to(FinancialInstitution.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved financial_institution as @financial_institution" do
        # Trigger the behavior that occurs when invalid params are submitted
        FinancialInstitution.any_instance.stub(:save).and_return(false)
        post :create, {:financial_institution => {}}
        assigns(:financial_institution).should be_a_new(FinancialInstitution)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        FinancialInstitution.any_instance.stub(:save).and_return(false)
        post :create, {:financial_institution => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested financial_institution" do
        financial_institution = FinancialInstitution.create! valid_attributes
        FinancialInstitution.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => financial_institution.to_param, :financial_institution => {'these' => 'params'}}
      end

      it "assigns the requested financial_institution as @financial_institution" do
        financial_institution = FinancialInstitution.create! valid_attributes
        put :update, {:id => financial_institution.to_param, :financial_institution => valid_attributes}
        assigns(:financial_institution).should eq(financial_institution)
      end

      it "redirects to the financial_institution" do
        financial_institution = FinancialInstitution.create! valid_attributes
        put :update, {:id => financial_institution.to_param, :financial_institution => valid_attributes}
        response.should redirect_to(financial_institution)
      end
    end

    describe "with invalid params" do
      it "assigns the financial_institution as @financial_institution" do
        financial_institution = FinancialInstitution.create! valid_attributes
        FinancialInstitution.any_instance.stub(:save).and_return(false)
        put :update, {:id => financial_institution.to_param, :financial_institution => {}}
        assigns(:financial_institution).should eq(financial_institution)
      end

      it "re-renders the 'edit' template" do
        financial_institution = FinancialInstitution.create! valid_attributes
        FinancialInstitution.any_instance.stub(:save).and_return(false)
        put :update, {:id => financial_institution.to_param, :financial_institution => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested financial_institution" do
      financial_institution = FinancialInstitution.create! valid_attributes
      expect {
        delete :destroy, {:id => financial_institution.to_param}
      }.to change(FinancialInstitution, :count).by(-1)
    end

    it "redirects to the financial_institutions list" do
      financial_institution = FinancialInstitution.create! valid_attributes
      delete :destroy, {:id => financial_institution.to_param}
      response.should redirect_to(financial_institutions_url)
    end
  end

end
