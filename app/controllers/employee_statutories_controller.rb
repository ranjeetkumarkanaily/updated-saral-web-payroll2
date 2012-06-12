class EmployeeStatutoriesController < ApplicationController

  # GET /employee_statutories/new
  # GET /employee_statutories/new.json
  def new
    @chk_pf_percentg = false
    @vpf_value = nil
    @employee_id = params[:employee_id]
    @display_panoption = true
    @based_on = nil
    @employee = Employee.find(params[:employee_id])
    @employee_statutory =  @employee.build_employee_statutory
    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @employee_statutory }
    end
  end

  # GET /employee_statutories/1/edit
  def edit
    @vpf_value = nil
    @employee_id = params[:employee_id]
    @employee_statutory = EmployeeStatutory.find_by_employee_id(params[:employee_id])
    !@employee_statutory.pan_present? ? @display_panoption = true : @display_panoption = false
    @based_on = @employee_statutory.based_on
    if @employee_statutory.vol_pf
      !@employee_statutory.vol_pf_percentage.nil? ? @chk_pf_percentg = true : @chk_pf_percentg = false
      @employee_statutory.vol_pf_percentage.nil? ? @vpf_value = @employee_statutory.vol_pf_amount : @vpf_value = @employee_statutory.vol_pf_percentage
    end

  end

  # POST /employee_statutories
  # POST /employee_statutories.json
  def create
    employee=params[:employee_statutory]
     dates_value=[employee[:pan_effective_date],employee[:pf_effective_date], employee[:esi_effective_date]]
    date_format=OptionSetting.date_format_value
    if(date_format == "%m-%Y-%d" || date_format == "%m/%d/%Y" || date_format == "%d/%m/%y" || date_format == "%d-%m-%y")
      dates=OptionSetting.convert_date(dates_value)
      val=employee.merge!(:pan_effective_date=>dates[0],:pf_effective_date=>dates[1],:esi_effective_date=>dates[2])
      @employee_statutory = EmployeeStatutory.new(val)
    else
      @employee_statutory = EmployeeStatutory.new(params[:employee_statutory])
    end
    @employee_statutory.pan = params[:panoption] if ( params[:employee_statutory][:pan].blank? and !params[:panoption].blank? and params[:panoption] != "ADD PAN")
    @employee_id = @employee_statutory.employee_id
    params[:chk_vol_pf_pertg] ? @employee_statutory.vol_pf_percentage = params[:vol_pf_value] : @employee_statutory.vol_pf_amount = params[:vol_pf_value]
    params[:employee_statutory][:based_on] = params[:based_on]
    respond_to do |format|
      if @employee_statutory.save
        format.html { redirect_to employee_path(:id => @employee_id ), notice: 'Employee statutory was successfully created.' }
        format.json { render json: @employee_statutory, status: :created, location: @employee_statutory }
      else
        format.html { render "new" ,@employee_id => @employee_id }
        format.json { render json: @employee_statutory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employee_statutories/1
  # PUT /employee_statutories/1.json
  def update
    params[:employee_statutory][:pan] = params[:panoption] if ( params[:employee_statutory][:pan].blank? and !params[:panoption].blank? and params[:panoption] != "ADD PAN")
    if params[:chk_vol_pf_pertg]
      params[:employee_statutory][:vol_pf_percentage] = params[:vol_pf_value]
      params[:employee_statutory][:vol_pf_amount] = nil
    else
      params[:employee_statutory][:vol_pf_amount] = params[:vol_pf_value]
      params[:employee_statutory][:vol_pf_percentage] = nil
    end
    params[:employee_statutory][:based_on] = params[:based_on]

    dates_value=[params[:employee_statutory][:pan_effective_date],params[:employee_statutory][:pf_effective_date], params[:employee_statutory][:esi_effective_date]]
    date_format=OptionSetting.date_format_value
    if(date_format == "%m-%Y-%d" || date_format == "%m/%d/%Y" || date_format == "%d/%m/%y" || date_format == "%d-%m-%y")
      dates=OptionSetting.convert_date(dates_value)
      params[:employee_statutory].merge!(:pan_effective_date=>dates[0],:pf_effective_date=>dates[1],:esi_effective_date=>dates[2])
    else
      params[:employee_statutory]
    end

    @employee_statutory = EmployeeStatutory.find(params[:id])
    respond_to do |format|
      if @employee_statutory.update_attributes(params[:employee_statutory])
        @employee_statutory.update_details
        format.html { redirect_to employee_path(:id => @employee_statutory.employee_id ), notice: 'Employee statutory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @employee_statutory.errors, status: :unprocessable_entity }
      end
    end
  end

end


