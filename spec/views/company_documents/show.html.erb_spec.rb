require 'spec_helper'

describe "company_documents/show" do
  before(:each) do
    @company_document = assign(:company_document, stub_model(CompanyDocument,
      :remarks => "Remarks",
      :company_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Remarks/)
    rendered.should match(/1/)
  end
end
