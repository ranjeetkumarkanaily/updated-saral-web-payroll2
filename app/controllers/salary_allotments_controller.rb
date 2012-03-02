class SalaryAllotmentsController < ApplicationController

  def index
    @need_to_allot_Sal = Employee.employee_with_salary_not_allotted.order("created_at ASC").paginate(:page => params[:page], :per_page => 10)
    @already_allot_Sal = Employee.employee_with_salary_allotted.order("created_at ASC").paginate(:page => params[:page], :per_page => 10)
    @param_selected_tab = params[:param1]
    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @allotSal }
      format.pdf { render :layout => false }
    end
  end

  def edit
    @param_selected_tab = params[:param1]
    @allotSal = SalaryAllotment.row_for_salary_allotment params[:id]
  end

  def update
    params[:salAllotment].each do |salAllot|
      allotSal = SalaryAllotment.find(salAllot[:id])
      allotSal.update_attributes(salAllot)
    end
    redirect_to salary_allotments_path(:param1 => params[:selected]), notice: 'Salary Allotted successfully'
  end

end