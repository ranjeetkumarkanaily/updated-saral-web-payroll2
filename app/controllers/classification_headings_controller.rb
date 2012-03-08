class ClassificationHeadingsController < ApplicationController
  # GET /classification_headings
  # GET /classification_headings.json
  def index
    @classification_headings = ClassificationHeading.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @classification_headings }
    end
  end

  # GET /classification_headings/1
  # GET /classification_headings/1.json
  def show
    @classification_heading = ClassificationHeading.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @classification_heading }
    end
  end

  # GET /classification_headings/new
  # GET /classification_headings/new.json
  def new
    @classification_heading = ClassificationHeading.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @classification_heading }
    end
  end

  # GET /classification_headings/1/edit
  def edit
    @classification_heading = ClassificationHeading.find(params[:id])
  end

  # POST /classification_headings
  # POST /classification_headings.json
  def create
    @classification_heading = ClassificationHeading.new(params[:classification_heading])

    respond_to do |format|
      if @classification_heading.save
        format.html { redirect_to classification_headings_url, notice: 'Classification heading was successfully created.' }
        format.json { render json: @classification_heading, status: :created, location: @classification_heading }
      else
        format.html { render action: "new" }
        format.json { render json: @classification_heading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /classification_headings/1
  # PUT /classification_headings/1.json
  def update
    @classification_heading = ClassificationHeading.find(params[:id])

    respond_to do |format|
      if @classification_heading.update_attributes(params[:classification_heading])
        format.html { redirect_to classification_headings_url, notice: 'Classification heading was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @classification_heading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classification_headings/1
  # DELETE /classification_headings/1.json
  def destroy
    @classification_heading = ClassificationHeading.find(params[:id])
    @classification_heading.destroy

    respond_to do |format|
      format.html { redirect_to classification_headings_url }
      format.json { head :ok }
    end
  end
end
