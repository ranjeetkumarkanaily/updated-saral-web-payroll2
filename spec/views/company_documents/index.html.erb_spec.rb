require 'spec_helper'

describe "company_documents/index" do
  before(:each) do
    assign(:company_documents, [
      stub_model(CompanyDocument,
        :remarks => "Remarks",
        :company_id => 1
      ),
      stub_model(CompanyDocument,
        :remarks => "Remarks",
        :company_id => 1
      )
    ])
  end

  it "renders a list of company_documents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Remarks".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
