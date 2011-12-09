class SalaryAllotmentsController < ApplicationController

  def index
    if params[:employee_id]
      @allotSal = SalaryAllotment.where("employee_id = #{params[:employee_id]} and effective_date = (select MAX(effective_date) from salary_allotments where employee_id = salary_allotments.employee_id)").order('id ASC')
      respond_to do |format|
        format.html # index.html.haml
        format.json { render json: @allotSal }
        format.pdf { render :layout => false }
      end
    end
  end

  def update
    params[:salAllotment].each do |salAllot|
      allotSal = SalaryAllotment.find(salAllot[:id])
      allotSal.update_attributes(salAllot)
    end
    redirect_to salary_allotments_path, notice: 'Salary Allotted successfully'
  end

end