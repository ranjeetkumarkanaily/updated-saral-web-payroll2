class SalariesController < ApplicationController
  def new
    if(params[:month_year] && params[:employee_id])
      allotted_salaries = SalaryAllotment.get_allotted_salaries params[:month_year], params[:employee_id]
      if(!Salary.is_salary_generated? params[:month_year], params[:employee_id])
        if allotted_salaries.count > 0
          @salary_allotments = allotted_salaries
        else
          #@salary_allotments = []
          @salary_allotments = SalaryAllotment.get_allotted_salaries_for_max_effective_date params[:employee_id]
          #salary_allotments.each do |sal_allot|
          #  last_date_month = get_last_date_of_month_year params[:month_year]
          #  @salary_allotments.push sal_allot.attributes.merge(:effective_date => last_date_month)
          #end
        end
      end
    end
  end

  def index
    @sal = Salary.first

    if params[:month_year] && params[:employee_id]
      @salary_earning = Salary.get_salary_on_salary_type "Earnings", params[:month_year], params[:employee_id]
      @salary_deduction = Salary.get_salary_on_salary_type "Deductions", params[:month_year], params[:employee_id]

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

  end

  #private
  #  def get_last_date_of_month_year month_year
  #    month_year = month_year.split('/')
  #    Date.new(month_year[1].to_i, month_year[0].to_i + 1) - 1
  #  end

end