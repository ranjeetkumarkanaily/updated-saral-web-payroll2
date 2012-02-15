require 'spec_helper'

describe "financial_institutions/index" do
  before(:each) do
    assign(:financial_institutions, [
      stub_model(FinancialInstitution,
        :name => "Name",
        :address_line1 => "Address Line1",
        :address_line2 => "Address Line2",
        :address_line3 => "Address Line3",
        :address_line4 => "Address Line4",
        :pincode => "Pincode",
        :branch_code => "Branch Code",
        :email => "Email"
      ),
      stub_model(FinancialInstitution,
        :name => "Name",
        :address_line1 => "Address Line1",
        :address_line2 => "Address Line2",
        :address_line3 => "Address Line3",
        :address_line4 => "Address Line4",
        :pincode => "Pincode",
        :branch_code => "Branch Code",
        :email => "Email"
      )
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of financial_institutions" do
    render
    rendered.should have_content('Name')
  end
end
