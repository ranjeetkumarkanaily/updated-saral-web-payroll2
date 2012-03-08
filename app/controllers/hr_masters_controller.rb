class HrMastersController < ApplicationController
  # GET /hr_masters
  # GET /hr_masters.json
  def index
    @hr_masters = HrMaster.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @hr_masters }
    end
  end

  # GET /hr_masters/1
  # GET /hr_masters/1.json
  def show
    @hr_master = HrMaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @hr_master }
    end
  end

  # GET /hr_masters/new
  # GET /hr_masters/new.json
  def new

    @hr_master = HrMaster.new
    @employee_id = params[:employee_id]
    @hr_category_id = params[:hr_category_id]

    ### Category Name for displaying at form
    @hr_category = HrCategory.find_by_id(@hr_category_id)
    @hr_masters = HrMaster.find_all_by_employee_id_and_hr_category_id(@employee_id, @hr_category_id)

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @hr_master }
    end
  end

  # GET /hr_masters/1/edit
  def edit
    #@hr_masters = HrMaster.find_all_by_employee_id_and_hr_category_id(@employee_id, @hr_category_id)
    @hr_master = HrMaster.find(params[:id])
    @employee_id = @hr_master.employee_id
    @hr_category_id = @hr_master.hr_category_id
  end

  # POST /hr_masters
  # POST /hr_masters.json
  def create
    @hr_master = HrMaster.new(params[:hr_master])
    respond_to do |format|
      if @hr_master.save
        format.html { redirect_to new_hr_master_path(:employee_id => params[:hr_master][:employee_id], :hr_category_id => params[:hr_master][:hr_category_id]), notice: 'Hr master was successfully updated.' }
        format.json { render json: @hr_master, status: :created, location: @hr_master }
      else
        #puts @hr_master.errors.full_messages
        format.html { redirect_to new_hr_master_path(:errors => @hr_master.errors.full_messages, :employee_id => params[:hr_master][:employee_id], :hr_category_id => params[:hr_master][:hr_category_id]) }
        format.json { render json: @hr_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hr_masters/1
  # PUT /hr_masters/1.json
  def update
    @hr_master = HrMaster.find(params[:id])

    respond_to do |format|
      if @hr_master.update_attributes(params[:hr_master])
        format.html { redirect_to new_hr_master_path(:employee_id => params[:hr_master][:employee_id], :hr_category_id => params[:hr_master][:hr_category_id]), notice: 'Hr master was successfully updated.' }
        format.json { head :ok }
      else
        puts @hr_master.inspect
        format.html { render action: "edit" }
        #format.html { redirect_to edit_hr_master_path(:id => @hr_master.id) }
        format.json { render json: @hr_master.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /hr_masters/1
  # DELETE /hr_masters/1.json
  def destroy
    @hr_master = HrMaster.find(params[:id])
    @employee_id = @hr_master.employee_id
    @hr_category_id = @hr_master.hr_category_id
    @hr_master.destroy

    respond_to do |format|
      format.html { redirect_to new_hr_master_path(:employee_id => @employee_id, :hr_category_id => @hr_category_id) }
      format.json { head :ok }
    end
  end
end
