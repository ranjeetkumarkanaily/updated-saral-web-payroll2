require 'spec_helper'

describe HrMaster do

  it { should belong_to(:employee)}
  it { should belong_to(:hr_category)}

  xit "should set error hash" do
    hr_master = FactoryGirl.create(:hr_master, :category_values => "")
    #puts hr_master.hr_category.category_name
    #puts "kanaily"
    #puts hr_master.validates_presence.to_s
    #hr_master.errors.should include("category values for #{hr_master.hr_category.category_name} is required")

  end
end