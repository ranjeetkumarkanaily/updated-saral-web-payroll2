class SalariesController < ApplicationController
  def new
    if(params[:month_year] && params[:employee_id])
      allotted_salaries = SalaryAllotment.get_allotted_salaries params[:month_year], params[:employee_id]
      if(!Salary.is_salary_generated? params[:month_year], params[:employee_id])
        if allotted_salaries.count > 0
          @salary_allotments = allotted_salaries
        else
          @salary_allotments = SalaryAllotment.get_allotted_salaries_for_max_effective_date params[:month_year], params[:employee_id]
        end
      end
    end
  end

  def index
    if params[:month_year] && params[:employee_id]
      @salary_earning = Salary.get_salary_on_salary_type "Earnings", params[:month_year], params[:employee_id]
      @salary_deduction = Salary.get_salary_on_salary_type "Deductions", params[:month_year], params[:employee_id]
      @pf_amount = Salary.get_pf_amount params[:month_year], params[:employee_id]
      @esi_amount = Salary.get_esi_amount params[:month_year], params[:employee_id]
    end
  end

  def create
    if(params[:salary])
      params[:salary].each do |sal|
        Salary.create(sal)
      end
      redirect_to salaries_path
    end
  end

  def edit
    month_year = params[:month_year].split('/')
    employee_id = params[:employee_id]
    @salary = Salary.where("extract(month from effective_date) = #{month_year[0]} and extract(year from effective_date) = #{month_year[1]} AND employee_id = #{employee_id}")
  end

  def update
    params[:salary].each do |sal|
      allotSal = Salary.find(sal[:id])
      allotSal.update_attributes(sal)
    end
    redirect_to salaries_path, notice: 'Salary updated successfully'
  end

end