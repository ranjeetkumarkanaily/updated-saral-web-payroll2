class PfEsiRatesController < ApplicationController
  def index
    #if params[:month_year]
    #  @pfesirate = PfEsiRate.find_by_paymonth_id(params[:month_year])
    #end
    @pfesirate = PfEsiRate.order('id ASC').paginate(:page => params[:page], :per_page => 10)
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

  def edit
    @pfesirate = PfEsiRate.find(params[:id])
  end


  def show
    @pfesirate = PfEsiRate.find(params[:id])
  end

  def update
    @pfesirate = PfEsiRate.find(params[:id])

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

end
