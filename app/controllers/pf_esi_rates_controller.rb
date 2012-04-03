class PfEsiRatesController < ApplicationController

  before_filter :find_pf_esi_rate, :only => [:edit, :show, :update]

  def index
    @pfesirate = PfEsiRate.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @pfesirate = PfEsiRate.new
  end

  def create
    @pfesirate = PfEsiRate.new(params[:pf_esi_rate])
    respond_to do |format|
      if @pfesirate.save
        format.html { redirect_to @pfesirate, notice: 'Rate was successfully created.' }
        format.json { render json: @pfesirate, status: :created, location: @pfesirate }
      else
        format.html { render action: "new" }
        format.json { render json: @pfesirate.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pfesirate.update_attributes(params[:pf_esi_rate])
        format.html { redirect_to @pfesirate, notice: 'PF ESI Rate was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @pfesirate.errors, status: :unprocessable_entity }
      end
    end
  end

  protected
    def find_pf_esi_rate
      @pfesirate = PfEsiRate.find(params[:id])
    end
end
