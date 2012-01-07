require 'spec_helper'

describe Designation do

  before(:each) do
    @attr = {
        :designation => 'Manager'
    }
  end

  it { should have_many(:employees)}

  it "should require a designation" do
    no_designation = Designation.new(@attr.merge(:designation => ""))
    no_designation.should_not be_valid
  end

  it "rejects duplicate designation" do
    Designation.create!(@attr)
    duplicate_designation = Designation.new(@attr)
    duplicate_designation.should_not be_valid
  end

  it "rejects designation identical up to case" do
    upcased_designation = @attr[:designation].upcase
    Designation.create!(@attr.merge(:designation => upcased_designation))
    duplicate_designation = Designation.new(@attr)
    duplicate_designation.should_not be_valid
  end
end
