class EmployeesController < ApplicationController
  # GET /employees
  # GET /employees.json
  require 'will_paginate/array'

  def index
    if params[:search]
      @employees = Employee.order('created_at ASC').search(params[:search]).paginate(:page => params[:page], :per_page => 10)
    else
      @employees = Employee.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)
    end

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @employees }
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @employee }
    end
  end

  # GET /employees/new
  # GET /employees/new.json
  def new
    @employee = Employee.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    @employee = Employee.find(params[:id])
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(params[:employee])

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render json: @employee, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
    @employee = Employee.find(params[:id])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :ok }
    end
  end

  # Upload excel sheet for bulk insertion employee
  def upload

  end

  # save , parse and validate the excel file
  def upload_parse_validate
    test_file = params[:excel_file]
    file = FileUploader.new
    file.store!(test_file)
    book = Spreadsheet.open "#{file.store_path}"
    sheet1 = book.worksheet 0
    @employees = []
    @errors = Hash.new
    @counter = 0
    sheet1.each 1 do |row|
      @counter+=1

      e = Employee.new
      e.refno = row[0]
      e.empname = row[1]
      e.father_name = row[2]
      e.marital_status = row[3]
      e.spouse_name = row[4]
      e.gender = row[5]
      e.date_of_birth = row[6]
      e.date_of_joining = row[7]
      e.date_of_leaving = row[8]
      e.present_res_no = row[9]
      e.present_res_name = row[10]
      e.present_street = row[11]
      e.present_locality = row[12]
      e.present_city = row[13]
      e.present_state = State.find_by_state_name(row[14])
      e.email = row[15]
      e.mobile = row[16].to_s
      e.designation = Designation.find_by_designation(row[17])
      e.department = Department.find_by_department(row[18])
      e.grade = Grade.find_by_grade(row[19])
      e.branch = Branch.find_by_branch_name(row[20])
      e.bank_account_number = row[21]
      e.financial_institution = FinancialInstitution.find_by_name(row[22])

      if e.valid?
        @employees << e
      else
        @errors["#{@counter+1}"] = e.errors
      end
    end

    if @errors.empty?
      save_employee @employees
      redirect_to employees_path
    end

    file.remove!
  end

  def report
    if params[:report_type]
      @company = Company.first
      @report_type = params[:report_type]
      @report_type_change = @report_type.split("_").each{|word| word.capitalize!}.join(" ")


      if params[:report][:designation_id] != "" && params[:report][:designation_id] != nil
        condition = " designation_id = #{params[:report][:designation_id]}"
      end

      if params[:report][:department_id] != "" && params[:report][:department_id] != nil
        condition += " and " if condition.length > 0
        condition += " department_id = #{params[:report][:department_id]}"
      end

      if params[:report][:grade_id] != "" && params[:report][:grade_id] != nil
        condition += " and " if condition.length > 0
        condition += " grade_id = #{params[:report][:grade_id]}"
      end

      if @report_type != "Contact"
        (condition)? condition = condition + " and #{@report_type} IS NOT NULL" : condition = "#{@report_type} IS NOT NULL"
        @employees = Employee.select("refno,empname,#{@report_type}").where(condition).order('created_at ASC')
      else
        @employees = Employee.select("refno,empname,mobile,email,present_res_no,present_res_name,present_street,present_locality,present_city,present_state_id").where(condition).order('created_at ASC')
      end

      respond_to do |format|
        format.html # new.html.haml
        format.pdf do
          render :pdf => 'Report',
                 :template => 'employees/report.pdf.haml'
        end
      end
    end
  end

  def pf_contribution_restrict
    if params[:search]
      @employeesList = Employee.order('created_at ASC').search(params[:search])
    else
      @employeesList = Employee.order('created_at ASC')
    end
  end

  def pf_restrict_update
    params[:employee_data].each do |value|
      @val=Employee.find(value[:id])
      #puts val.inspect
      if value[:pf].nil?
        @val.update_attribute(:restrct_pf,false)
      else
        @val.update_attribute(:restrct_pf,true)
      end
    end
    redirect_to pf_contribution_restrict_employees_path
  end

  private
    def save_employee employees
      employees.each do |employee|
        employee.save
      end
    end

end
