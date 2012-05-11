require 'spec_helper'

describe CompanyDocumentsController do

  before :each do
     controller.stub(:logged_in?).and_return(true)
     @company = FactoryGirl.create(:company,:photo => Rails.root.join("spec/factories/icon_a.png").open)
     @file_specs= FactoryGirl.create(:upload_file_type)
  end

  def valid_attributes
    {
        :id => 2,
        :remarks=>"test",
        :company_id => @company.id,
        :file_path => fixture_file_upload( 'spec/factories/sdata.pdf')
    }
  end

  describe "GET new" do
    it "assigns a new company_document as @company_document" do
      get :new, {:id => @company.id}
      assigns(:company_document).should be_a_new(CompanyDocument)
    end
  end

  describe "POST create" do
      describe "with valid params" do
        it "creates a new CompanyDocument" do
          file_path = fixture_file_upload( 'spec/factories/docs.doc', 'application/msword')
          expect {
            post :create, :company_document =>  {:remarks=>"test",:company_id => @company.id,:file_path => file_path}
          }.to change(CompanyDocument, :count).by(1)
        end
      end
  end

  describe "DELETE destroy" do
    it "should delete the company document" do
      company_document=CompanyDocument.create! valid_attributes
      expect {
              delete :destroy, :id => company_document.id
            }.to change(CompanyDocument, :count).by(-1)
    end
  end

  describe "GET download" do
    it "should display the file" do
      company_document=CompanyDocument.create! valid_attributes
      get :download , :id => company_document.id
      response.should be_success
    end
  end
end