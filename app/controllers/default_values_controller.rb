class DefaultValuesController < ApplicationController
  # GET /default_values
  # GET /default_values.json
  def index
    @default_values = DefaultValue.all

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @default_values }
    end
  end

  # GET /default_values/1
  # GET /default_values/1.json
  def show
    @default_value = DefaultValue.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @default_value }
    end
  end

  # GET /default_values/new
  # GET /default_values/new.json
  def new
    @default_value = DefaultValue.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @default_value }
    end
  end

  # GET /default_values/1/edit
  def edit
    @default_value = DefaultValue.find(params[:id])
  end

  # POST /default_values
  # POST /default_values.json
  def create
    @default_value = DefaultValue.new(params[:default_value])

    respond_to do |format|
      if @default_value.save
        format.html { redirect_to @default_value, notice: 'Default value was successfully created.' }
        format.json { render json: @default_value, status: :created, location: @default_value }
      else
        format.html { render action: "new" }
        format.json { render json: @default_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /default_values/1
  # PUT /default_values/1.json
  def update
    @default_value = DefaultValue.find(params[:id])

    respond_to do |format|
      if @default_value.update_attributes(params[:default_value])
        format.html { redirect_to @default_value, notice: 'Default value was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @default_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /default_values/1
  # DELETE /default_values/1.json
  def destroy
    @default_value = DefaultValue.find(params[:id])
    @default_value.destroy

    respond_to do |format|
      format.html { redirect_to default_values_url }
      format.json { head :ok }
    end
  end
end
