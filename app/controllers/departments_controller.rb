class DepartmentsController < ApplicationController
  # GET /departments
  # GET /departments.json
  def index
    @departments = Department.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @departments }
    end
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
    @department = Department.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @department }
    end
  end

  # GET /departments/new
  # GET /departments/new.json
  def new
    @department = Department.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @department }
    end
  end

  # GET /departments/1/edit
  def edit
    @department = Department.find(params[:id])
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = Department.new(params[:department])

    respond_to do |format|
      if @department.save
        format.html { redirect_to departments_url, notice: 'Department was successfully created.' }
        format.json { render json: @department, status: :created, location: @department }
      else
        format.html { render action: "new" }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /departments/1
  # PUT /departments/1.json
  def update
    @department = Department.find(params[:id])

    respond_to do |format|
      if @department.update_attributes(params[:department])
        format.html { redirect_to departments_url, notice: 'Department was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    chk_department_exist_in_employee = Employee.find_all_by_department_id(params[:id])
    if chk_department_exist_in_employee.count > 0
      respond_to do |format|
        format.html { redirect_to departments_url, notice: 'Department is already assigned to employee.' }
        format.json { head :ok }
      end
    else
      @department = Department.find(params[:id])
      @department.destroy

      respond_to do |format|
        format.html { redirect_to departments_url, notice: 'Department was successfully deleted.' }
        format.json { head :ok }
      end
    end
  end
end
