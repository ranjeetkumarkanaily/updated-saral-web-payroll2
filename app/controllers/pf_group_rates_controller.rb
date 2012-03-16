class PfGroupRatesController < ApplicationController
  # GET /pf_group_rates
  # GET /pf_group_rates.json
  def index
    @param_pf_group_id = params[:params1]
    @pf_group_rates = PfGroupRate.where(:pf_group_id => @param_pf_group_id).order('paymonth_id DESC,created_at DESC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @pf_group_rates }
    end
  end

  # GET /pf_group_rates/1
  # GET /pf_group_rates/1.json
  def show
    @param_pf_group_id = params[:params1]
    @pf_group_rate = PfGroupRate.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @pf_group_rate }
    end
  end

  # GET /pf_group_rates/new
  # GET /pf_group_rates/new.json
  def new
    @param_pf_group_id = params[:params1]
    @pf_group_rate = PfGroupRate.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @pf_group_rate }
    end
  end

  # GET /pf_group_rates/1/edit
  def edit
    @param_pf_group_id = params[:params1]
    @pf_group_rate = PfGroupRate.find(params[:id])
  end

  # POST /pf_group_rates
  # POST /pf_group_rates.json
  def create

    @param_pf_group_id = params[:pf_group_rate][:pf_group_id]
    @pf_group_rate = PfGroupRate.new(params[:pf_group_rate])
    effective_date = Paymonth.find(params[:pf_group_rate][:paymonth_id]).from_date
    respond_to do |format|
      if @pf_group_rate.save
        last_saved = PfGroupRate.find(@pf_group_rate.id)
        last_saved.update_attribute(:effective_date,effective_date)
        format.html { redirect_to pf_group_rates_url(:params1 => @param_pf_group_id), notice: 'Pf group rate was successfully created.' }
        format.json { render json: @pf_group_rate, status: :created, location: @pf_group_rate }
      else
        format.html { render action: "new" }
        format.json { render json: @pf_group_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pf_group_rates/1
  # PUT /pf_group_rates/1.json
  def update
    @pf_group_rate = PfGroupRate.find(params[:id])
    @param_pf_group_id = params[:pf_group_rate][:pf_group_id]
    respond_to do |format|
      if @pf_group_rate.update_attributes(params[:pf_group_rate])
        format.html { redirect_to pf_group_rates_url(:params1 => @param_pf_group_id), notice: 'Pf group rate was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @pf_group_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pf_group_rates/1
  # DELETE /pf_group_rates/1.json
  def destroy
    @pf_group_rate = PfGroupRate.find(params[:id])
    @param_pf_group_id = @pf_group_rate.pf_group_id
    @pf_group_rate.destroy

    respond_to do |format|
      format.html { redirect_to pf_group_rates_url(:params1 => @param_pf_group_id), notice: 'Pf group rate was successfully Destroyed.' }
      format.json { head :ok }
    end
  end
end
