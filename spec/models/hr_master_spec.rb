require 'spec_helper'

describe HrMaster do

  it { should belong_to(:employee)}
  it { should belong_to(:hr_category)}

  it "should set error hash" do
    first_catgry_det = FactoryGirl.create(:hr_category_detail)
    FactoryGirl.create(:hr_category_detail, :hr_category_id => first_catgry_det.hr_category_id, :name => "Age", :data_type => "String", :required => true)
    hr_master = HrMaster.new(:hr_category_id => first_catgry_det.hr_category_id, :category_values => "Name => Kanaily")
    hr_master.save
    hr_master.errors.full_messages.should eq(["Hr master category values for \"Age\" is required"])
  end
end