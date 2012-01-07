class EmployeesController < ApplicationController
  # GET /employees
  # GET /employees.json
  require 'will_paginate/array'

  def index
    if params[:search]
      @employees = Employee.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
    else
      @employees = Employee.all(:order => 'id ASC').paginate(:page => params[:page], :per_page => 10)
    end

    respond_to do |format|
      format.html # index.html.haml
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
      e.designation_id = Designation.find_by_designation(row[17])
      e.department_id = Department.find_by_department(row[18])
      e.grade_id = Grade.find_by_grade(row[19])

      #puts Designation.find_by_designation(row[17]).inspect
      #puts Department.find_by_department(row[18]).inspect
      #puts Grade.find_by_grade(row[19]).inspect
      #puts e.valid?
      #puts e.errors.full_messages

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

  end

  private
    def save_employee employees
      employees.each do |employee|
        employee.save
      end
    end

end
