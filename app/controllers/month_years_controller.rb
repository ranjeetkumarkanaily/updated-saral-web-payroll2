class MonthYearsController < ApplicationController
  # GET /month_years
  # GET /month_years.json
  def index
    @month_years = MonthYear.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @month_years }
    end
  end

  # GET /month_years/1
  # GET /month_years/1.json
  def show
    @month_year = MonthYear.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @month_year }
    end
  end

  # GET /month_years/new
  # GET /month_years/new.json
  def new
    @month_year = MonthYear.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @month_year }
    end
  end

  # GET /month_years/1/edit
  def edit
    @month_year = MonthYear.find(params[:id])
  end

  # POST /month_years
  # POST /month_years.json
  def create
    @month_year = MonthYear.new(params[:month_year])

    respond_to do |format|
      if @month_year.save
        format.html { redirect_to @month_year, notice: 'Month year was successfully created.' }
        format.json { render json: @month_year, status: :created, location: @month_year }
      else
        format.html { render action: "new" }
        format.json { render json: @month_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /month_years/1
  # PUT /month_years/1.json
  def update
    @month_year = MonthYear.find(params[:id])

    respond_to do |format|
      if @month_year.update_attributes(params[:month_year])
        format.html { redirect_to @month_year, notice: 'Month year was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @month_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /month_years/1
  # DELETE /month_years/1.json
  def destroy
    @month_year = MonthYear.find(params[:id])
    @month_year.destroy

    respond_to do |format|
      format.html { redirect_to month_years_url }
      format.json { head :ok }
    end
  end
end
