class HrCategoryDetailsController < ApplicationController
  # GET /hr_category_details
  # GET /hr_category_details.json
  def index
    @hr_category_id = params[:param1]
    @hr_category_details = HrCategoryDetail.where("hr_category_id = ?", @hr_category_id).order('created_at ASC').paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @hr_category_details }
    end
  end

  # GET /hr_category_details/1
  # GET /hr_category_details/1.json
  def show
    @hr_category_detail = HrCategoryDetail.find(params[:id])
    @hr_category_id = @hr_category_detail.hr_category_id
    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @hr_category_detail }
    end
  end

  # GET /hr_category_details/new
  # GET /hr_category_details/new.json
  def new

    @hr_category_detail = HrCategoryDetail.new
    @hr_category_id = params[:param1]
    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @hr_category_detail }
    end
  end

  # GET /hr_category_details/1/edit
  def edit
    @hr_category_detail = HrCategoryDetail.find(params[:id])
    if params[:param1]
      @hr_category_id = params[:param1]
    else
      @hr_category_id = @hr_category_detail.hr_category_id
    end
  end

  # POST /hr_category_details
  # POST /hr_category_details.json
  def create
    @hr_category_detail = HrCategoryDetail.new(params[:hr_category_detail])

    respond_to do |format|
      if @hr_category_detail.save
        format.html { redirect_to @hr_category_detail, notice: 'Hr category detail was successfully created.' }
        format.json { render json: @hr_category_detail, status: :created, location: @hr_category_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @hr_category_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hr_category_details/1
  # PUT /hr_category_details/1.json
  def update
    @hr_category_detail = HrCategoryDetail.find(params[:id])
    respond_to do |format|
      if @hr_category_detail.update_attributes(params[:hr_category_detail])
        format.html { redirect_to hr_category_details_path(:param1 => params[:hr_category_detail]['hr_category_id']), notice: 'Hr category detail was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @hr_category_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hr_category_details/1
  # DELETE /hr_category_details/1.json
  def destroy
    @hr_category_detail = HrCategoryDetail.find(params[:id])
    @hr_category_detail.destroy

    respond_to do |format|
      format.html { redirect_to hr_category_details_url }
      format.json { head :ok }
    end
  end
end
