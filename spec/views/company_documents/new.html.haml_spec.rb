require 'spec_helper'

describe "company_documents/new" do
  before(:each) do
    assign(:company_document, stub_model(CompanyDocument,
      :remarks => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new company_document form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => company_documents_path, :method => "post" do
      assert_select "input#company_document_remarks", :name => "company_document[remarks]"
      assert_select "input#company_document_company_id", :name => "company_document[company_id]"
    end
  end
end
