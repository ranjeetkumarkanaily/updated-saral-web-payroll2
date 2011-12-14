require 'spec_helper'

describe SalaryAllotment do
  it { should belong_to(:salary_head)}

  it { should belong_to(:employee_detail)}

  it "should return allotted salaries" do
    sal_allot = FactoryGirl.create(:salary_allotment)
    SalaryAllotment.get_allotted_salaries("02/2011",sal_allot.employee_id).should be_true
  end

  it "should return allotted salaries for previous effective date" do
    sal_allot = FactoryGirl.create(:salary_allotment)
    SalaryAllotment.get_allotted_salaries_for_max_effective_date(sal_allot.employee_id).should be_true
  end

end