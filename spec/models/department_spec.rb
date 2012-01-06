require 'spec_helper'

describe Department do
  before(:each) do
    @attr = {
        :department => 'WDO'
    }
  end

  it { should have_many(:employees)}

  it "should require a department" do
    no_department = Department.new(@attr.merge(:department => ""))
    no_department.should_not be_valid
  end

  it "rejects duplicate department" do
    Department.create!(@attr)
    duplicate_department = Department.new(@attr)
    duplicate_department.should_not be_valid
  end

  it "rejects department identical up to case" do
    upcased_department = @attr[:department].upcase
    Department.create!(@attr.merge(:department => upcased_department))
    duplicate_department = Department.new(@attr)
    duplicate_department.should_not be_valid
  end
end
