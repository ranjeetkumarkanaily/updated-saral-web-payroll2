class SalaryAllotmentsController < ApplicationController

  def index
    @need_to_allot_Sal = SalaryAllotment.get_employee_with_salary_not_allotted.paginate(:page => params[:page], :per_page => 10)
    @already_allot_Sal = SalaryAllotment.get_employee_with_salary_allotted.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @allotSal }
      format.pdf { render :layout => false }
    end
  end

  def edit
    @allotSal = SalaryAllotment.where("employee_id = #{params[:id]} and effective_date = (select MAX(effective_date) from salary_allotments where employee_id = #{params[:id]})").order('salary_head_id ASC')
  end

  def update
    params[:salAllotment].each do |salAllot|
      allotSal = SalaryAllotment.find(salAllot[:id])
      allotSal.update_attributes(salAllot)
    end
    redirect_to salary_allotments_path, notice: 'Salary Allotted successfully'
  end

end