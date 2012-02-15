require 'spec_helper'

describe "financial_institutions/new" do
  before(:each) do
    assign(:financial_institution, stub_model(FinancialInstitution,
      :name => "MyString",
      :address_line1 => "MyString",
      :address_line2 => "MyString",
      :address_line3 => "MyString",
      :address_line4 => "MyString",
      :pincode => "MyString",
      :branch_code => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new financial_institution form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => financial_institutions_path, :method => "post" do
      assert_select "input#financial_institution_name", :name => "financial_institution[name]"
      assert_select "input#financial_institution_address_line1", :name => "financial_institution[address_line1]"
      assert_select "input#financial_institution_address_line2", :name => "financial_institution[address_line2]"
      assert_select "input#financial_institution_address_line3", :name => "financial_institution[address_line3]"
      assert_select "input#financial_institution_address_line4", :name => "financial_institution[address_line4]"
      assert_select "input#financial_institution_pincode", :name => "financial_institution[pincode]"
      assert_select "input#financial_institution_branch_code", :name => "financial_institution[branch_code]"
      assert_select "input#financial_institution_email", :name => "financial_institution[email]"
    end
  end
end
