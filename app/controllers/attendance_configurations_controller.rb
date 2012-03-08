class AttendanceConfigurationsController < ApplicationController
  # GET /attendance_configurations
  # GET /attendance_configurations.json
  def index
    @attendance_configurations = AttendanceConfiguration.where('id>1').order('created_at ASC').paginate(:page => params[:page], :per_page => 10)


    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @attendance_configurations }
    end
  end

  # GET /attendance_configurations/1
  # GET /attendance_configurations/1.json
  def show
    @attendance_configuration = AttendanceConfiguration.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @attendance_configuration }
    end
  end

  # GET /attendance_configurations/new
  # GET /attendance_configurations/new.json
  def new
    @attendance_configuration = AttendanceConfiguration.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @attendance_configuration }
    end
  end

  # GET /attendance_configurations/1/edit
  def edit
    @attendance_configuration = AttendanceConfiguration.find(params[:id])
  end

  # POST /attendance_configurations
  # POST /attendance_configurations.json
  def create
    @attendance_configuration = AttendanceConfiguration.new(params[:attendance_configuration])

    respond_to do |format|
      if @attendance_configuration.save
        format.html { redirect_to attendance_configurations_url, notice: 'Attendance configuration was successfully created.' }
        format.json { render json: @attendance_configuration, status: :created, location: @attendance_configuration }
      else
        format.html { render action: "new" }
        format.json { render json: @attendance_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attendance_configurations/1
  # PUT /attendance_configurations/1.json
  def update
    @attendance_configuration = AttendanceConfiguration.find(params[:id])

    respond_to do |format|
      if @attendance_configuration.update_attributes(params[:attendance_configuration])
        format.html { redirect_to attendance_configurations_url, notice: 'Attendance configuration was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendance_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendance_configurations/1
  # DELETE /attendance_configurations/1.json
  def destroy
    @attendance_configuration = AttendanceConfiguration.find(params[:id])
    @attendance_configuration.destroy

    respond_to do |format|
      format.html { redirect_to attendance_configurations_url }
      format.json { head :ok }
    end
  end
end
