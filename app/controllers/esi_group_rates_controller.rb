class EsiGroupRatesController < ApplicationController
  # GET /esi_group_rates
  # GET /esi_group_rates.json
  def index
    @param_esi_group_id = params[:params1]
    @esi_group_rates = EsiGroupRate.where(:esi_group_id => @param_esi_group_id).order('created_at ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @esi_group_rates }
    end
  end

  # GET /esi_group_rates/1
  # GET /esi_group_rates/1.json
  def show
    @esi_group_rate = EsiGroupRate.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @esi_group_rate }
    end
  end

  # GET /esi_group_rates/new
  # GET /esi_group_rates/new.json
  def new
    @param_esi_group_id = params[:params1]
    @esi_group_rate = EsiGroupRate.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @esi_group_rate }
    end
  end

  # GET /esi_group_rates/1/edit
  def edit
    @param_esi_group_id = params[:params1]
    @esi_group_rate = EsiGroupRate.find(params[:id])
  end

  # POST /esi_group_rates
  # POST /esi_group_rates.json
  def create
    @param_esi_group_id = params[:esi_group_rate][:esi_group_id]
    @esi_group_rate = EsiGroupRate.new(params[:esi_group_rate])

    respond_to do |format|
      if @esi_group_rate.save
        format.html { redirect_to esi_group_rates_url(:params1 => @param_esi_group_id), notice: 'Esi group rate was successfully created.' }
        format.json { render json: @esi_group_rate, status: :created, location: @esi_group_rate }
      else
        format.html { render action: "new" }
        format.json { render json: @esi_group_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /esi_group_rates/1
  # PUT /esi_group_rates/1.json
  def update
    @esi_group_rate = EsiGroupRate.find(params[:id])
    @param_esi_group_id = params[:esi_group_rate][:esi_group_id]
    respond_to do |format|
      if @esi_group_rate.update_attributes(params[:esi_group_rate])
        format.html { redirect_to esi_group_rates_url(:params1 => @param_esi_group_id), notice: 'Esi group rate was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @esi_group_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /esi_group_rates/1
  # DELETE /esi_group_rates/1.json
  def destroy
    @esi_group_rate = EsiGroupRate.find(params[:id])
    @param_esi_group_id = @esi_group_rate.esi_group_id
    @esi_group_rate.destroy

    respond_to do |format|
      format.html { redirect_to esi_group_rates_url(:params1 => @param_esi_group_id) }
      format.json { head :ok }
    end
  end
end
