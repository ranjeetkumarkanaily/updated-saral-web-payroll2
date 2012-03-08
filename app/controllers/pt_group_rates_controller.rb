class PtGroupRatesController < ApplicationController
  # GET /pt_group_rates
  # GET /pt_group_rates.json
  def index
    @pt_group_rates = PtGroupRate.all

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @pt_group_rates }
    end
  end

  # GET /pt_group_rates/1
  # GET /pt_group_rates/1.json
  def show
    @pt_group_rate = PtGroupRate.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @pt_group_rate }
    end
  end

  # GET /pt_group_rates/new
  # GET /pt_group_rates/new.json
  def new
    @pt_group_rate = PtGroupRate.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @pt_group_rate }
    end
  end

  # GET /pt_group_rates/1/edit
  def edit
    @pt_group_rate = PtGroupRate.find(params[:id])
  end

  # POST /pt_group_rates
  # POST /pt_group_rates.json
  def create
    @pt_group_rate = PtGroupRate.new(params[:pt_group_rate])

    respond_to do |format|
      if @pt_group_rate.save
        format.html { redirect_to pt_group_path(:id => @pt_group_rate.pt_group_id), notice: 'Pt group rate was successfully created.' }
        format.json { render json: @pt_group_rate, status: :created, location: @pt_group_rate }
      else
        format.html { render action: "new" }
        format.json { render json: @pt_group_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pt_group_rates/1
  # PUT /pt_group_rates/1.json
  def update
    @pt_group_rate = PtGroupRate.find(params[:id])

    respond_to do |format|
      if @pt_group_rate.update_attributes(params[:pt_group_rate])
        format.html { redirect_to @pt_group_rate, notice: 'Pt group rate was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @pt_group_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pt_group_rates/1
  # DELETE /pt_group_rates/1.json
  def destroy
    @pt_group_rate = PtGroupRate.find(params[:id])
    @pt_group_rate.destroy

    respond_to do |format|
      format.html { redirect_to pt_group_rates_url }
      format.json { head :ok }
    end
  end
end
