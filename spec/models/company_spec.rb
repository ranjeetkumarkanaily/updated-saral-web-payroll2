require 'spec_helper'

describe Company do
  before(:each) do
    @valid_attributes = {:companyname => "Relyon Softech Ltd.",
                         :responsible_person => "Myself",
                         :address => "My Street",
                         :website => "www.relyonsoft.com",
                         :dateofestablishment => "2010-10-30"}
  end

  describe Company do
    it "should create a company with valid attributes" do
      Company.create! @valid_attributes
    end

    it "should require a company name" do
      no_companyname = Company.new(@valid_attributes.merge(:companyname => ""))
      no_companyname.should_not be_valid
    end

    it "should require a responsible person" do
      no_responsiblePerson = Company.new(@valid_attributes.merge(:responsible_person => ""))
      no_responsiblePerson.should_not be_valid
    end

    it "should require a company address" do
      no_address = Company.new(@valid_attributes.merge(:address => ""))
      no_address.should_not be_valid
    end

    it "should reject company name longer than 100 chars" do
      too_longname = "d"*101
      long_company = Company.new(:companyname => too_longname)
      long_company.should_not be_valid
    end

    #it "should reject invalid website url" do
    #  invalid_website = Company.new(:website => "123")
    #  invalid_website.should_not be_valid
    #end

    it { should have_attached_file(:photo) }
  end
end
