class SalariesController < ApplicationController
  def new
    if(params[:month_year] && params[:employee_id])
      month_year = Date.strptime params[:month_year], '%b/%Y'
      start_date = month_year.beginning_of_month
      employee_dol = Employee.chk_dol params[:employee_id]
      if employee_dol && employee_dol < start_date
        redirect_to new_salary_path, notice: 'Employee already left the Company'
      else
        allotted_salaries = SalaryAllotment.get_allotted_salaries params[:month_year], params[:employee_id]
        #if(!Salary.is_salary_generated? params[:month_year], params[:employee_id])
        if allotted_salaries.count > 0
          @salary_allotments = allotted_salaries
        else
          @salary_allotments = SalaryAllotment.get_allotted_salaries_for_max_effective_date params[:month_year], params[:employee_id]
        end
        #end
      end
    end
  end

  def index
    flash[:notice] = ""
    if params[:month_year] && params[:employee_id]
      @company = Company.first
      @employee = Employee.find(params[:employee_id])
      month_year = Date.strptime params[:month_year], '%b/%Y'
      leave_count = Salary.find_employees_leave month_year.beginning_of_month, month_year.end_of_month ,params[:employee_id]
      @no_of_day_in_selected_month = Paymonth.select('number_of_days').where("to_date = '#{month_year.end_of_month}'")
      @no_of_day_in_selected_month = @no_of_day_in_selected_month[0]['number_of_days'].to_i

      employee_dol = Employee.chk_dol params[:employee_id]
      if employee_dol
        no_of_day_if_dol_exist = employee_dol.day
        @no_of_present_days = no_of_day_if_dol_exist - leave_count
      else
        @no_of_present_days = @no_of_day_in_selected_month - leave_count
      end

      @salary_earning = Salary.get_salary_on_salary_type "Earnings", params[:month_year], params[:employee_id],0
      @salary_deduction = Salary.get_salary_on_salary_type "Deductions", params[:month_year], params[:employee_id],0

      @pt_amount = Salary.get_pt_amount params[:month_year], params[:employee_id]
      @vol_pf_amount = PfCalculatedValue.calculated_vol_pf_amount params[:month_year], params[:employee_id]

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