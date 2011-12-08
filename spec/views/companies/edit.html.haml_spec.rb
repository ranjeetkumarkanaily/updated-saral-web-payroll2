require 'spec_helper'

describe "companies/edit.html.haml" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :companyname => "My Test Company",
      :reponsible_person => "My Name",
      :address => "Address",
      :website => "www.website.com"
      ))
  end

  it "renders the edit company form" do
    render

    assert_select "form", :action => companies_path(@employee), :method => "post" do
    assert_select "input#company_companyname", :name => "company[companyname]"
    end
  end
end



