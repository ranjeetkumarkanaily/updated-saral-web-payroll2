class SalaryAllotmentsController < ApplicationController

  def index
    @need_to_allot_Sal = Employee.employee_with_salary_not_allotted.order("created_at ASC").paginate(:page => params[:page], :per_page => 10)
    @already_allot_Sal = Employee.employee_with_salary_allotted.order("created_at ASC").paginate(:page => params[:page], :per_page => 10)
    @param_selected_tab = params[:param1]
    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @allotSal }
      format.pdf { render :layout => false }
    end
  end

  def edit
    @param_selected_tab = params[:param1]

    @allotSal = SalaryAllotment.row_for_salary_allotment params[:id]
    @emp_name = Employee.find(params[:id]).empname
  end

  def update

    params[:salAllotment].each do |salAllot|
      allotSal = SalaryAllotment.find(salAllot[:id])
      allotSal.update_attributes(salAllot)
    end
    redirect_to salary_allotments_path(:param1 => params[:selected]), notice: 'Salary Allotted successfully'
  end

  def upload

  end

  def upload_parse_validate
    excel_file = params[:excel_file]
    file = FileUploader.new
    file.store!(excel_file)
    book = Spreadsheet.open "#{file.store_path}"
    theoretical_salary_sheet = book.worksheet 0

    @sal_allotments = SalaryAllotment.process_salary_excel_sheet theoretical_salary_sheet
    if @sal_allotments["errors"].empty?
      SalaryAllotment.update_salary_allotments @sal_allotments["salary_allotments"]
      redirect_to salary_allotments_path(:param1 => "allotted"), notice: 'Salary Allotted successfully'
    end

    file.remove!
  end

  def generate_sample_excel_template
    @sal_heads = SalaryHead.select("short_name").where('id != 2 and id != 3').order('created_at ASC')

    respond_to do |format|
      format.xls do
        render :xls => 'Salary Rate Template',
               :handlers => [:haml],
               :format => [:xls],
               :template => 'salary_allotments/generate_sample_excel_template'
      end
    end
  end

end