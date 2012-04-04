class EsiGroupRatesController < ApplicationController

  before_filter :param_esi_group_id, :only => [:index, :new, :edit]
  before_filter :find_esi_group_rate, :only => [:update, :destroy]

  def index
    @esi_group_rates = EsiGroupRate.where(:esi_group_id => @param_esi_group_id).order('created_at ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @esi_group_rates }
    end
  end

  def new
    @esi_group_rate = EsiGroupRate.new
    @esi_group = EsiGroup.find(@param_esi_group_id).esi_group_name
    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @esi_group_rate }
    end
  end

  def edit
    @esi_group_rate = EsiGroupRate.find(params[:id])
  end

  def create
    @param_esi_group_id = params[:esi_group_rate][:esi_group_id]
    @esi_group_rate = EsiGroupRate.new(params[:esi_group_rate])

    respond_to do |format|
      if @esi_group_rate.save
        format.html { redirect_to esi_group_rates_url(:params1 => @param_esi_group_id), notice: 'Esi group rate was successfully created.' }
        format.json { render json: @esi_group_rate, status: :created, location: @esi_group_rate }
      else
        format.html { render 'new' }
        format.json { render json: @esi_group_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /esi_group_rates/1
  # PUT /esi_group_rates/1.json
  def update
    @param_esi_group_id = params[:esi_group_rate][:esi_group_id]
    respond_to do |format|
      if @esi_group_rate.update_attributes(params[:esi_group_rate])
        format.html { redirect_to esi_group_rates_url(:params1 => @param_esi_group_id), notice: 'Esi group rate was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render 'edit' }
        format.json { render json: @esi_group_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @param_esi_group_id = @esi_group_rate.esi_group_id
    @esi_group_rate.destroy

    respond_to do |format|
      format.html { redirect_to esi_group_rates_url(:params1 => @param_esi_group_id) }
      format.json { head :ok }
    end
  end

  protected
    def param_esi_group_id
      @param_esi_group_id = params[:params1]
    end

    def find_esi_group_rate
      @esi_group_rate = EsiGroupRate.find(params[:id])
    end
end
