class LeaveDefinitionsController < ApplicationController
  # GET /leave_definitions
  # GET /leave_definitions.json
  def index
    @leave_definitions = LeaveDefinition.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leave_definitions }
    end
  end

  # GET /leave_definitions/1
  # GET /leave_definitions/1.json
  def show
    @leave_definition = LeaveDefinition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @leave_definition }
    end
  end

  # GET /leave_definitions/new
  # GET /leave_definitions/new.json
  def new
    @leave_definition = LeaveDefinition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @leave_definition }
    end
  end

  # GET /leave_definitions/1/edit
  def edit
    @leave_definition = LeaveDefinition.find(params[:id])
  end

  # POST /leave_definitions
  # POST /leave_definitions.json
  def create
    @leave_definition = LeaveDefinition.new(params[:leave_definition])

    respond_to do |format|
      if @leave_definition.save
        format.html { redirect_to leave_definitions_url, notice: 'Leave definition was successfully created.' }
        format.json { render json: leave_definitions_url, status: :created, location: leave_definitions_url }
      else
        format.html { render action: "new" }
        format.json { render json: @leave_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leave_definitions/1
  # PUT /leave_definitions/1.json
  def update
    @leave_definition = LeaveDefinition.find(params[:id])

    respond_to do |format|
      if @leave_definition.update_attributes(params[:leave_definition])
        format.html { redirect_to leave_definitions_url, notice: 'Leave definition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @leave_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_definitions/1
  # DELETE /leave_definitions/1.json
  def destroy
    @leave_definition = LeaveDefinition.find(params[:id])
    @leave_definition.destroy

    respond_to do |format|
      format.html { redirect_to leave_definitions_url }
      format.json { head :no_content }
    end
  end
end
