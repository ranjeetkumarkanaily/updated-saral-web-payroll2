require 'spec_helper'

describe SalaryGroupDetail do
  describe "Association" do
    it { should belong_to(:salary_group)}

    it { should belong_to(:salary_head)}

    it { should have_many(:salary_allotments)}

    it { should have_many(:salaries)}
  end

  describe "Effective to month" do
    before :each do
      @salary_head = SalaryHead.create(:head_name=>"DA",:short_name=>"DA",:salary_type=>"Earnings")
      @salary_group = FactoryGirl.create(:salary_group)
      @salary_group_detail = FactoryGirl.create(:salary_group_detail,:salary_head_id=>@salary_head.id,:salary_group_id=>@salary_group.id)
    end

    it "should return effective to month" do
      sal_grp_detail = FactoryGirl.create(:salary_group_detail,:salary_head_id=>@salary_head.id,:salary_group_id=>@salary_group.id,:effective_month=>"Apr/2011")
      previous_sal_group = SalaryGroupDetail.previous_salary_grp_details @salary_group.id,@salary_head.id
      @salary_group_detail.effective_to_month.strftime("%Y-%m-%d").should eq("2011-03-31")
    end
  end


end
