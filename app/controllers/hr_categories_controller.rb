class HrCategoriesController < ApplicationController
  # GET /hr_categories
  # GET /hr_categories.json
  def index
    @hr_categories = HrCategory.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @hr_categories }
    end
  end

  # GET /hr_categories/1
  # GET /hr_categories/1.json
  def show
    @hr_category = HrCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @hr_category }
    end
  end

  # GET /hr_categories/new
  # GET /hr_categories/new.json
  def new
    @hr_category = HrCategory.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @hr_category }
    end
  end

  # GET /hr_categories/1/edit
  def edit
    @hr_category = HrCategory.find(params[:id])
  end

  # POST /hr_categories
  # POST /hr_categories.json
  def create
    @hr_category = HrCategory.new(params[:hr_category])

    respond_to do |format|
      if @hr_category.save
        format.html { redirect_to @hr_category, notice: 'Hr category was successfully created.' }
        format.json { render json: @hr_category, status: :created, location: @hr_category }
      else
        format.html { render action: "new" }
        format.json { render json: @hr_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hr_categories/1
  # PUT /hr_categories/1.json
  def update
    @hr_category = HrCategory.find(params[:id])

    respond_to do |format|
      if @hr_category.update_attributes(params[:hr_category])
        format.html { redirect_to @hr_category, notice: 'Hr category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @hr_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hr_categories/1
  # DELETE /hr_categories/1.json
  def destroy
    @hr_category = HrCategory.find(params[:id])
    @hr_category.destroy

    respond_to do |format|
      format.html { redirect_to hr_categories_url }
      format.json { head :ok }
    end
  end
end
