require 'spec_helper'

describe SalaryGroup do
  before(:each) do
    @attr =
        {
            :salary_group_name => "Test",
            :based_on_gross => false
        }
  end
  it { should have_many(:salary_group_details)}

  it "should require a salary group name" do
    no_grp_name = SalaryGroup.new(@attr.merge(:salary_group_name => ""))
    no_grp_name.should_not be_valid
  end

  it "should not accept salary group name that are more than 100 characters long " do
    long_name = "k" * 101
    long_grp_name = SalaryGroup.new(@attr.merge(:salary_group_name => long_name))
    long_grp_name.should_not be_valid
  end

  it "salary group name should be unique" do
    SalaryGroup.create!(@attr)
    sal_grp_name_dup = SalaryGroup.new(@attr)
    sal_grp_name_dup.should_not be_valid
  end

end
