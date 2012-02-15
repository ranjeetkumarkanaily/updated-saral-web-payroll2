require 'spec_helper'

describe "financial_institutions/show" do
  before(:each) do
    @financial_institution = assign(:financial_institution, stub_model(FinancialInstitution,
      :name => "Name",
      :address_line1 => "Address Line1",
      :address_line2 => "Address Line2",
      :address_line3 => "Address Line3",
      :address_line4 => "Address Line4",
      :pincode => "Pincode",
      :branch_code => "Branch Code",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address Line1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address Line2/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address Line3/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address Line4/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Pincode/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Branch Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
  end
end
