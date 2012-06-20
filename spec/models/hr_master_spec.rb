require 'spec_helper'

describe HrMaster do

  it { should belong_to(:employee)}
  it { should belong_to(:hr_category)}

  it "should set error hash" do
    first_hr_category = FactoryGirl.create(:hr_category)
    first_hr_category_detail = FactoryGirl.create(:hr_category_detail,:hr_category_id => first_hr_category.id)
    sec_hr_category_detail = FactoryGirl.create(:hr_category_detail,:hr_category_id => first_hr_category.id,:name=>"Age")
    hr_master = HrMaster.new(:hr_category_id => first_hr_category.id,:category_values => "#{first_hr_category_detail.id}=>rahul")
    hr_master.save
    hr_master.errors.full_messages.should eq(["Hr master category values for \"Age\" is required"])
  end

  it "should give category detail name provided hr_category id and hr_category_detail id" do
    hr_master = HrMaster.new()
    first_hr_category_detail = FactoryGirl.create(:hr_category_detail)
    name = hr_master.category_name(first_hr_category_detail.id,first_hr_category_detail.hr_category_id)
    name.should eq(first_hr_category_detail.name)

  end
end