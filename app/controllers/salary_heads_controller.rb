class SalaryHeadsController < ApplicationController
  # GET /salary_heads
  # GET /salary_heads.json
  def index
    @salary_heads = SalaryHead.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @salary_heads }
    end
  end

  # GET /salary_heads/1
  # GET /salary_heads/1.json
  def show
    @salary_head = SalaryHead.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @salary_head }
    end
  end

  # GET /salary_heads/new
  # GET /salary_heads/new.json
  def new
    @salary_head = SalaryHead.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @salary_head }
    end
  end

  # GET /salary_heads/1/edit
  def edit
    @salary_head = SalaryHead.find(params[:id])
  end

  # POST /salary_heads
  # POST /salary_heads.json
  def create
    @salary_head = SalaryHead.new(params[:salary_head])

    respond_to do |format|
      if @salary_head.save
        format.html { redirect_to @salary_head, notice: 'Salary head was successfully created.' }
        format.json { render json: @salary_head, status: :created, location: @salary_head }
      else
        format.html { render action: "new" }
        format.json { render json: @salary_head.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /salary_heads/1
  # PUT /salary_heads/1.json
  def update
    @salary_head = SalaryHead.find(params[:id])

    respond_to do |format|
      if @salary_head.update_attributes(params[:salary_head])
        format.html { redirect_to @salary_head, notice: 'Salary head was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @salary_head.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salary_heads/1
  # DELETE /salary_heads/1.json
  def destroy
    @salary_head = SalaryHead.find(params[:id])
    @salary_head.destroy

    respond_to do |format|
      format.html { redirect_to salary_heads_url }
      format.json { head :ok }
    end
  end
end
