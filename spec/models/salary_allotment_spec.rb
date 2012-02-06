require 'spec_helper'

describe SalaryAllotment do
  it { should belong_to(:salary_head)}

  it { should belong_to(:employee)}

  it { should belong_to(:employee_detail)}

  it { should belong_to(:salary_group_detail)}

  it "should return allotted salaries" do
    salary_group_detail = FactoryGirl.create(:salary_group_detail)
    sal_allot = FactoryGirl.create(:salary_allotment, :salary_group_detail_id => salary_group_detail.id)
    SalaryAllotment.get_allotted_salaries("Feb/2011",sal_allot.employee_id).should be_true
  end

  it "should return allotted salaries for previous effective date" do
    salary_group_detail = FactoryGirl.create(:salary_group_detail)
    sal_allot = FactoryGirl.create(:salary_allotment, :salary_group_detail_id => salary_group_detail.id)
    SalaryAllotment.get_allotted_salaries_for_max_effective_date("Feb/2011", sal_allot.employee_id).should be_true
  end

  describe "generation of formula" do
    before :each do
      @salHeadBasic = FactoryGirl.create(:salary_head)
      @salHeadDA = FactoryGirl.create(:salary_head, head_name: "DA",short_name: "DA", salary_type: "Earnings")
      @salHeadHRA = FactoryGirl.create(:salary_head, head_name: "HRA",short_name: "HRA", salary_type: "Earnings")

      @salaryGrp = FactoryGirl.create(:salary_group, based_on_gross: true)

      @salaryGrpDetBasic = FactoryGirl.create(:salary_group_detail, salary_group_id: @salaryGrp.id, salary_head_id: @salHeadBasic.id, calc_type: "Formula", calculation: "GROSS * 40/100")
      @salaryGrpDetHRA = FactoryGirl.create(:salary_group_detail, salary_group_id: @salaryGrp.id, salary_head_id: @salHeadHRA.id, calc_type: "Formula", calculation: "(BASIC + DA) * 30/100")

    end

    it "should give nested formula" do
      salaryGrpDetDA = FactoryGirl.create(:salary_group_detail, salary_group_id: @salaryGrp.id, salary_head_id: @salHeadDA.id, calc_type: "Formula", calculation: "GROSS * 20/100")
      employee_detail = FactoryGirl.create(:employee_detail, salary_group_id: @salaryGrp.id)
      sal_allotHRA = FactoryGirl.create(:salary_allotment, :salary_group_detail_id => @salaryGrpDetHRA.id, salary_head_id: @salHeadHRA.id, employee_detail_id: employee_detail.id)
      formula = sal_allotHRA.generation_formula
      formula.should eq("( (GROSS * 40/100) + (GROSS * 20/100) ) * 30/100")
    end

    it "should give 0 value in nested formula if calc_type of salary head is not formula" do
      salaryGrpDetDA = FactoryGirl.create(:salary_group_detail, salary_group_id: @salaryGrp.id, salary_head_id: @salHeadDA.id, calc_type: "Lumpsum", calculation: "")
      employee_detail = FactoryGirl.create(:employee_detail, salary_group_id: @salaryGrp.id)
      sal_allotHRA = FactoryGirl.create(:salary_allotment, :salary_group_detail_id => @salaryGrpDetHRA.id, salary_head_id: @salHeadHRA.id, employee_detail_id: employee_detail.id)
      formula = sal_allotHRA.generation_formula
      formula.should eq("( (GROSS * 40/100) + 0 ) * 30/100")
    end

  end

end