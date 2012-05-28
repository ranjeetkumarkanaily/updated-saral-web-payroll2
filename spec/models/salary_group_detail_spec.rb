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
      @salary_group_detail = FactoryGirl.create(:salary_group_detail)
    end

    it "should return effective to month" do
      salary_head = SalaryHead.create(:head_name=>"DA",:short_name=>"DA",:salary_type=>"Earnings")
      sal_grp_detail = FactoryGirl.create(:salary_group_detail,:salary_head_id=>salary_head.id,:effective_month=>"Apr/2011")
      previous_sal_group = SalaryGroupDetail.previous_salary_grp_details sal_grp_detail.salary_group_id,salary_head.id
      puts previous_sal_group
      sal_grp_detail.effective_to_month.should eq('2011-03-01')
    end
  end


end
