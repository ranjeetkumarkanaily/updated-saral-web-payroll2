class ClassificationHeadingsController < ApplicationController

  before_filter :find_classification_heading, :only => [:show, :edit, :update, :destroy]

  def index
    @classification_headings = ClassificationHeading.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @classification_headings }
    end
  end

  def show
    @classification_heading = ClassificationHeading.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @classification_heading }
    end
  end

  def new
    @classification_heading = ClassificationHeading.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @classification_heading }
    end
  end

  def create
    @classification_heading = ClassificationHeading.new(params[:classification_heading])

    respond_to do |format|
      if @classification_heading.save
        format.html { redirect_to classification_headings_url, notice: 'Classification heading was successfully created.' }
        format.json { render json: @classification_heading, status: :created, location: @classification_heading }
      else
        format.html { render 'new' }
        format.json { render json: @classification_heading.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @classification_heading = ClassificationHeading.find(params[:id])

    respond_to do |format|
      if @classification_heading.update_attributes(params[:classification_heading])
        format.html { redirect_to classification_headings_url, notice: 'Classification heading was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render 'edit' }
        format.json { render json: @classification_heading.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @classification_heading.destroy

    respond_to do |format|
      format.html { redirect_to classification_headings_url }
      format.json { head :ok }
    end
  end

  protected
    def find_classification_heading
      @classification_heading = ClassificationHeading.find(params[:id])
    end
end
