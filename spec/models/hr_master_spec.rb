require 'spec_helper'

describe HrMaster do

  it { should belong_to(:employee)}
  it { should belong_to(:hr_category)}

  it "should set error hash" do
    FactoryGirl.create(:hr_category_detail)
    FactoryGirl.create(:hr_category_detail, :name => "Relation", :data_type => "String", :required => true)

  #  hr_master = FactoryGirl.create(:hr_master, :category_values => "")
  #  #puts hr_master.hr_category.category_name
  #  #puts "kanaily"
  #  #puts hr_master.validates_presence.to_s
  #  #hr_master.errors.should include("category values for #{hr_master.hr_category.category_name} is required")
  #
  end
end