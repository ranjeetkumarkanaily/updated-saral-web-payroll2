class HrCategoriesController < ApplicationController

  before_filter :find_hr_category, :only => [:edit, :update, :destroy]

  def index
    @hr_categories = HrCategory.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @hr_categories }
    end
  end

  def new
    @hr_category = HrCategory.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @hr_category }
    end
  end

  def create
    @hr_category = HrCategory.new(params[:hr_category])

    respond_to do |format|
      if @hr_category.save
        format.html { redirect_to hr_categories_path, notice: 'Hr category was successfully created.' }
        format.json { render json: @hr_category, status: :created, location: @hr_category }
      else
        format.html { render action: "new" }
        format.json { render json: @hr_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @hr_category.update_attributes(params[:hr_category])
        format.html { redirect_to hr_categories_path, notice: 'Hr category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @hr_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hr_category.destroy

    respond_to do |format|
      format.html { redirect_to hr_categories_url }
      format.json { head :ok }
    end
  end

  protected
    def find_hr_category
      @hr_category = HrCategory.find(params[:id])
    end
end
