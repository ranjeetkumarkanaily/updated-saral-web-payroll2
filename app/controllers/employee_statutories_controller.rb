class EmployeeStatutoriesController < ApplicationController

  # GET /employee_statutories/new
  # GET /employee_statutories/new.json
  def new
    @employee = Employee.find(params[:employee_id])
    @employee_statutory =  @employee.build_employee_statutory
    @employee_id = params[:employee_id]
    @display_panoption = true
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee_statutory }
    end
  end

  # GET /employee_statutories/1/edit
  def edit
    @display_panoption = false
    @employee_id = params[:employee_id]
    @employee_statutory = EmployeeStatutory.find_by_employee_id(params[:employee_id])
    @display_panoption = true if !@employee_statutory.pan_present?
  end

  # POST /employee_statutories
  # POST /employee_statutories.json
  def create
    @employee_statutory = EmployeeStatutory.new(params[:employee_statutory])
    @employee_statutory.pan = params[:panoption] if ( params[:employee_statutory][:pan].blank? and !params[:panoption].blank? and params[:panoption] != "ADD PAN")
    @employee_id = @employee_statutory.employee_id

    respond_to do |format|
      if @employee_statutory.save
        format.html { redirect_to employee_path(:id => @employee_id ), notice: 'Employee statutory was successfully created.' }
        format.json { render json: @employee_statutory, status: :created, location: @employee_statutory }
      else
        format.html { render action: "new" ,@employee_id => @employee_id }
        format.json { render json: @employee_statutory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employee_statutories/1
  # PUT /employee_statutories/1.json
  def update
    params[:employee_statutory][:pan] = params[:panoption] if ( params[:employee_statutory][:pan].blank? and !params[:panoption].blank? and params[:panoption] != "ADD PAN")
    @employee_statutory = EmployeeStatutory.find(params[:id])
    respond_to do |format|
      if @employee_statutory.update_attributes(params[:employee_statutory])
        @employee_statutory.update_details
        format.html { redirect_to employee_path(:id => @employee_statutory.employee_id ), notice: 'Employee statutory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee_statutory.errors, status: :unprocessable_entity }
      end
    end
  end

end


