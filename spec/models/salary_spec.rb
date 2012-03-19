require 'spec_helper'

describe Salary do
   it { should belong_to(:salary_head)}

  it { should belong_to(:employee_detail)}

  describe "Salary Calculation" do

    describe "salary generation" do
      before(:each) do
        @salary_head = FactoryGirl.create(:salary_head)
        @salary_group_detail = FactoryGirl.create(:salary_group_detail, :salary_head_id => @salary_head.id)
      end
      it "should return true (salary is generated for given employee for given month)" do
        salary = FactoryGirl.create(:salary, :salary_head_id => @salary_head.id, :salary_group_detail_id => @salary_group_detail.id)
        Salary.is_salary_generated?("Feb/2011", salary.employee_id).should be_true
      end

      it "should get salary on basis of salary type" do
        salary = FactoryGirl.create(:salary, :salary_head_id => @salary_head.id, :salary_group_detail_id => @salary_group_detail.id)
        getSalary = Salary.get_salary_on_salary_type salary.salary_head.salary_type, 'Feb/2011', salary.employee_id.to_s
        getSalary[0].salary_amount.should eq(1000.00)
        getSalary[0].salary_head.head_name.should eq("Basic")
      end
    end

    describe "find employee Leave" do
      it "should find employee leave" do
        leave_detail = FactoryGirl.create(:leave_detail)
        getleave = Salary.find_employees_leave '2011-01-01', '2011-01-31', leave_detail.employee_id.to_s
        getleave[0]['leave_count'].should eq("1")
      end
    end

    describe "get pt amount" do
      before(:each) do
        @salary_head = FactoryGirl.create(:salary_head)
        @salary_group_detail = FactoryGirl.create(:salary_group_detail, :salary_head_id => @salary_head.id)
      end

      it "should give pt amount within range defined" do
        salary = FactoryGirl.create(:salary, :salary_head_id => @salary_head.id, :salary_group_detail_id => @salary_group_detail.id)
        pt_rate = FactoryGirl.create(:pt_rate)
        get_pt = Salary.get_pt_amount "Feb/2011", salary.employee_id.to_s
        get_pt.should eq(100.00)
      end

      it "should give pt amount outside the range defined" do
        salary = FactoryGirl.create(:salary,:salary_amount => 17000, :salary_head_id => @salary_head.id, :salary_group_detail_id => @salary_group_detail.id)
        pt_rate = FactoryGirl.create(:pt_rate,:min_sal_range => 15000.0, :max_sal_range => 25000, :pt=>250.0)
        get_pt = Salary.get_pt_amount "Feb/2011", salary.employee_id.to_s
        get_pt.should eq(250.0)
      end

      it "should give pt amount outside the range defined" do
        salary = FactoryGirl.create(:salary,:salary_amount => 6000, :salary_head_id => @salary_head.id, :salary_group_detail_id => @salary_group_detail.id)
        pt_rate = FactoryGirl.create(:pt_rate,:min_sal_range => 7000.0)
        get_pt = Salary.get_pt_amount "Feb/2011", salary.employee_id.to_s
        get_pt.should eq(0)
      end

    end

    describe "get PF amount" do

      it "should give PF amount for selected employee and month" do
        salary_head = FactoryGirl.create(:salary_head)
        salary_group_detail = FactoryGirl.create(:salary_group_detail, :salary_head_id => salary_head.id)
        attendance_configuration = FactoryGirl.create(:attendance_configuration)
        financial_institution = FactoryGirl.create(:financial_institution)
        pf_group = FactoryGirl.create(:pf_group)
        paymonth = FactoryGirl.create(:paymonth)
        branch = FactoryGirl.create(:branch,:pf_group_id => pf_group.id)
        employee_detail = FactoryGirl.create(:employee_detail,:attendance_configuration_id => attendance_configuration.id,:branch_id => branch.id, :financial_institution_id => financial_institution.id)
        pf_group_rate = FactoryGirl.create(:pf_group_rate,:pf_group_id => pf_group.id, :paymonth_id => paymonth.id)


        salary = FactoryGirl.create(:salary,:salary_amount => 17000, :salary_head_id => salary_head.id, :salary_group_detail_id => salary_group_detail.id)
        pf_amount = Salary.get_pf_amount "Feb/2011", 1
        pf_amount.should eq(780.0)
      end
    end

    describe "get ESI amount" do
      it "should give ESI amount as 0 for selected employee and month" do
        salary_head = FactoryGirl.create(:salary_head)
        salary_group_detail = FactoryGirl.create(:salary_group_detail, :salary_head_id => salary_head.id)
        attendance_configuration = FactoryGirl.create(:attendance_configuration)
        financial_institution = FactoryGirl.create(:financial_institution)
        esi_group = FactoryGirl.create(:esi_group)
        paymonth = FactoryGirl.create(:paymonth)
        branch = FactoryGirl.create(:branch,:esi_group_id => esi_group.id)
        employee_detail = FactoryGirl.create(:employee_detail,:attendance_configuration_id => attendance_configuration.id,:branch_id => branch.id, :financial_institution_id => financial_institution.id)
        esi_group_rate = FactoryGirl.create(:esi_group_rate,:esi_group_id => esi_group.id)

        salary = FactoryGirl.create(:salary,:salary_amount => 17000, :salary_head_id => salary_head.id, :salary_group_detail_id => salary_group_detail.id)
        esi_amount = Salary.get_esi_amount "Feb/2011", 1
        esi_amount.should eq(0.0)
      end
    end

  end

end