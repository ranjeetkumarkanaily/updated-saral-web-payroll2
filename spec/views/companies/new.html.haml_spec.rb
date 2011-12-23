require 'spec_helper'

describe "companies/new.html.haml" do
  before(:each) do
    assign(:company, stub_model(Company,
      :companyname => "My test Company",
      :reponsible_person => "My Name",
      :address => "Address",
      :website => "www.website.com"
    ).as_new_record)
  end

  it "renders new company form" do
    render
      assert_select "form", :action => companies_path, :method => "post" do
        assert_select "input#company_companyname", :name => "company[companyname]"
        assert_select "input#company_responsible_person", :name => "company[responsible_person]"
        #assert_select ""
    end
  end
end
