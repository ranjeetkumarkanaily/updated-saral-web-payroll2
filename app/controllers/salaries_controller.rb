class SalariesController < ApplicationController
  def new
    if params[:month_year] && params[:salary_group]
      @employee_salary_calc_header = Salary.emp_salary_calc_header params[:salary_group]
      @employee_salary_calc = Salary.employees_salary_calculation params[:month_year], params[:salary_group]
    end
  end

  def index
    flash[:notice] = ""
    if params[:month_year] && params[:salary_group]
      @earning_det_head = Salary.employee_salary_det_header params[:salary_group],'Earnings'
      @deduction_det_head = Salary.employee_salary_det_header params[:salary_group],'Deductions'
      @employee_salary_det = Salary.employee_salary_detail params[:month_year], params[:salary_group]

      if params[:employee_id]
        @employee_payslip = Salary.employee_payslip params[:month_year], params[:employee_id]
      end

      if params[:email] == "yes"
        pdf = render_to_string :pdf => "Payslip", :template => 'salaries/index',:handlers => [:haml],:formats => [:pdf]
        save_path = Rails.root.join('pdfs','payslip.pdf')
        File.open(save_path, 'wb') do |file|
          file << pdf
        end
        UserMailer.mail_payslip(@employee,params[:month_year]).deliver
        UserMailer.cleanup
        flash[:notice] = 'Email has been sent successfully!!!'
      else
        respond_to do |format|
          format.html
          format.pdf do
            render :pdf => 'Payslip',
                   :handlers => [:haml],
                   :formats => [:pdf],
                   :template => 'salaries/index'
          end
        end
      end
    end
  end

  def create
    if(params[:salary])
      Salary.calculate_salary params[:salary], params[:month_year]
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

  def salary_sheet
    if params[:month_year]
      @company = Company.first
      @earning_heads = SalaryHead.salary_heads("Earnings")
      @deduction_heads = SalaryHead.salary_heads("Deductions")

      @employee_salary_detail = Salary.salary_sheet params[:month_year]

      @employee_salary_total = Salary.salary_total params[:month_year]

      respond_to do |format|
        format.xls do
          render :xls => 'Salary Sheet',
                 :handlers => [:haml],
                 :formats => [:xls],
                 :template => 'salaries/salary_sheet'
        end
      end
    end
  end
end