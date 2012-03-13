class HrMastersController < ApplicationController

  def new
    @hr_master = HrMaster.new
    @employee_id = params[:employee_id]
    @hr_category_id = params[:hr_category_id]
    ### Category Name for displaying at form
    @hr_category = HrCategory.find_by_id(@hr_category_id)
    @hr_category_details = @hr_category.hr_category_details.order("created_at ASC")
    @hr_masters = HrMaster.find_all_by_employee_id_and_hr_category_id(@employee_id, @hr_category_id)

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @hr_master }
    end
  end

  def edit
    @hr_master = HrMaster.find(params[:id])
    @employee_id = @hr_master.employee_id
    @hr_category_id = @hr_master.hr_category_id
  end

  def create
    @hr_master = HrMaster.new(params[:hr_master])
    respond_to do |format|
      if @hr_master.save
        format.html { redirect_to new_hr_master_path(:employee_id => params[:hr_master][:employee_id], :hr_category_id => params[:hr_master][:hr_category_id]), notice: 'Hr master was successfully updated.' }
        format.json { render json: @hr_master, status: :created, location: @hr_master }
      else
        format.html { redirect_to new_hr_master_path(:errors => @hr_master.errors.full_messages, :employee_id => params[:hr_master][:employee_id], :hr_category_id => params[:hr_master][:hr_category_id]) }
        format.json { render json: @hr_master.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @hr_master = HrMaster.find(params[:id])

    respond_to do |format|
      if @hr_master.update_attributes(params[:hr_master])
        format.html { redirect_to new_hr_master_path(:employee_id => params[:hr_master][:employee_id], :hr_category_id => params[:hr_master][:hr_category_id]), notice: 'Hr master was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @hr_master.errors, status: :unprocessable_entity }
      end
    end

  end

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
