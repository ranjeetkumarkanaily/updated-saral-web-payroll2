class SalariesController < ApplicationController
  def new

  end
  def index

  end

  def create
    if(params[:salary]) #&& params[:month_year] && params[:employee_id]
      params[:salary].each do |sal|
        Salary.create(sal)
      end
      redirect_to salaries_path

    elsif(params[:month_year] && params[:employee_id])

      month_year = params[:month_year].split('/')

      effective_dates = SalaryAllotment.select("effective_date").where("extract(month from effective_date) = #{month_year[0]} and extract(year from effective_date) = #{month_year[1]} AND employee_id = #{params[:employee_id]}")

      if(Salary.select("effective_date").where("extract(month from effective_date) = #{month_year[0]} and extract(year from effective_date) = #{month_year[1]} AND employee_id = #{params[:employee_id]}").count > 0)
        @salary_allotment = []
      else
        if effective_dates.count > 0
        @salary_allotment = SalaryAllotment.where("extract(month from effective_date) = #{month_year[0]} and extract(year from effective_date) = #{month_year[1]} AND employee_id = #{params[:employee_id]}").order("effective_date ASC")

      else
        @salary_allotment = SalaryAllotment.where("employee_id = #{params[:employee_id]} and effective_date = (select MAX(effective_date) from salary_allotments where employee_id = #{params[:employee_id]})")
      end
      end

      render "new"
    end
  end

  def edit
    @salary_detail = Salary.find(params[:id])
  end

end