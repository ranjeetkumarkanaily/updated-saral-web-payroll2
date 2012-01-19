class PtRatesController < ApplicationController
  # GET /pt_rates
  # GET /pt_rates.json
  def index
    @pt_rates = PtRate.order('min_sal_range ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @pt_rates }
    end
  end

  # GET /pt_rates/1
  # GET /pt_rates/1.json
  def show
    @pt_rate = PtRate.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @pt_rate }
    end
  end

  # GET /pt_rates/new
  # GET /pt_rates/new.json
  def new
    @pt_rate = PtRate.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @pt_rate }
    end
  end

  # GET /pt_rates/1/edit
  def edit
    @pt_rate = PtRate.find(params[:id])
  end

  # POST /pt_rates
  # POST /pt_rates.json
  def create
    @pt_rate = PtRate.new(params[:pt_rate])

    respond_to do |format|
      if @pt_rate.save
        format.html { redirect_to @pt_rate, notice: 'Pt rate was successfully created.' }
        format.json { render json: @pt_rate, status: :created, location: @pt_rate }
      else
        format.html { render action: "new" }
        format.json { render json: @pt_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  #PUT /pt_rates/1
  #PUT /pt_rates/1.json
  def update
    @pt_rate = PtRate.find(params[:id])

    respond_to do |format|
      if @pt_rate.update_attributes(params[:pt_rate])
        format.html { redirect_to @pt_rate, notice: 'Pt rate was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @pt_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pt_rates/1
  # DELETE /pt_rates/1.json
  def destroy
    @pt_rate = PtRate.find(params[:id])
    @pt_rate.destroy

    respond_to do |format|
      format.html { redirect_to pt_rates_url }
      format.json { head :ok }
    end
  end
end
