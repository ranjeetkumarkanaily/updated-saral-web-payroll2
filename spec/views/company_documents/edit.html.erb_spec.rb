require 'spec_helper'

describe "company_documents/edit" do
  before(:each) do
    @company_document = assign(:company_document, stub_model(CompanyDocument,
      :remarks => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit company_document form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => company_documents_path(@company_document), :method => "post" do
      assert_select "input#company_document_remarks", :name => "company_document[remarks]"
      assert_select "input#company_document_company_id", :name => "company_document[company_id]"
    end
  end
end
