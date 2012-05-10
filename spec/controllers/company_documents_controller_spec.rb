require 'spec_helper'

describe CompanyDocumentsController do

  before :each do
     controller.stub(:logged_in?).and_return(true)
     @company = FactoryGirl.create(:company,:photo => Rails.root.join("spec/factories/relyonlogo.png").open)
     @file_specs= FactoryGirl.create(:upload_file_type)
  end

  def valid_attributes
    {
        :remarks=>"test",
        :company_id => @company.id,
        :file_path => Rails.root.join("spec/factories/Guide.doc").open
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
          expect {
            post :create, :company_document =>  {:remarks=>"test",:company_id => @company.id,:file_path => Rails.root.join("spec/factories/Guide.doc").open}

          }.to change(CompanyDocument, :count).by(1)

          #FactoryGirl.create(:company_document, :file_path => Rails.root.join("spec/factories/paycss.text").open)

        end
      end
  end
end