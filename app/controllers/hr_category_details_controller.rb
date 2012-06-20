class HrCategoryDetailsController < ApplicationController

  before_filter :find_hr_category_detail, :only => [:edit, :update, :destroy]

  def index
    @hr_category_id = params[:param1]
    @hr_category_details = HrCategoryDetail.where("hr_category_id = ?", @hr_category_id).order('created_at ASC').paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @hr_category_details }
    end
  end

  def new
    @hr_category_detail = HrCategoryDetail.new
    @hr_category_id = params[:param1]
    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @hr_category_detail }
    end
  end

  def edit
    if params[:param1]
      @hr_category_id = params[:param1]
    else
      @hr_category_id = @hr_category_detail.hr_category_id
    end
  end

  def create
    @hr_category_detail = HrCategoryDetail.new(params[:hr_category_detail])

    respond_to do |format|
      if @hr_category_detail.save
        format.html { redirect_to hr_category_details_path(:param1=> @hr_category_detail.hr_category_id), notice: 'Hr category detail was successfully created.' }
        format.json { render json: @hr_category_detail, status: :created, location: @hr_category_detail }
      else
        format.html { render 'new' }
        format.json { render json: @hr_category_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @hr_category_detail.update_attributes(params[:hr_category_detail])
        format.html { redirect_to hr_category_details_path(:param1 => params[:hr_category_detail]['hr_category_id']), notice: 'Hr category detail was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render 'edit' }
        format.json { render json: @hr_category_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    hr_cat_det_id = @hr_category_detail.hr_category_id
    if HrMaster.where("category_values -> '#{@hr_category_detail.id}' != ''").empty?
      @hr_category_detail.destroy
      flash[:notice] = "Successfully destroyed."
    else
      flash[:error] = "Category Value is being used. Not allow to delete."
    end

    respond_to do |format|
      format.html { redirect_to hr_category_details_url(:param1 => hr_cat_det_id) }
      format.json { head :ok }
    end
  end

  protected
    def find_hr_category_detail
      @hr_category_detail = HrCategoryDetail.find(params[:id])
    end
end
