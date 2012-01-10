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
      month_year = Date.strptime params[:month_year], '%b/%Y'

      leave_count = Salary.find_employees_leave month_year.beginning_of_month, month_year.end_of_month ,params[:salary][0]['employee_id']
      leave_count = leave_count[0]['leave_count'].to_i
      no_of_day_in_selected_month = Paymonth.select('number_of_days').where("to_date = '#{month_year.end_of_month}'")
      #no_of_day_in_selected_month = no_of_day_in_selected_month[0]['number_of_days'].to_i
      no_of_day_in_selected_month = 28
      no_of_present_days = no_of_day_in_selected_month - leave_count

      params[:salary].each do |sal|
        updated_salary_amount = sal[:salary_amount].to_i * no_of_present_days / no_of_day_in_selected_month.to_f
        Salary.create(:effective_date => sal[:effective_date], :employee_detail_id => sal[:employee_detail_id], :employee_id => sal[:employee_id], :salary_amount => updated_salary_amount, :salary_head_id => sal[:salary_head_id])
      end
      redirect_to salaries_path
    end
  end

  def edit
    month_year = Date.strptime params[:month_year], '%b/%Y'
    employee_id = params[:employee_id]
    @salary = Salary.where("extract(month from effective_date) = #{month_year.month} and extract(year from effective_date) = #{month_year.year} AND employee_id = #{employee_id}")
  end

  def update
    params[:salary].each do |sal|
      allotSal = Salary.find(sal[:id])
      allotSal.update_attributes(sal)
    end
    redirect_to salaries_path, notice: 'Salary updated successfully'
  end

end