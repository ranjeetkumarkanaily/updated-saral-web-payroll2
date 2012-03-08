class ClassificationsController < ApplicationController
  # GET /classifications
  # GET /classifications.json
  def index
   @paramclassification_id = params[:params1]
    @classifications = Classification.where(:classification_heading_id => @paramclassification_id).order('created_at ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @classifications }
    end
  end

  # GET /classifications/1
  # GET /classifications/1.json
  def show
    @classification = Classification.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @classification }
    end
  end

  # GET /classifications/new
  # GET /classifications/new.json
  def new
    @paramclassification_id = params[:params1]
    @classification = Classification.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @classification }
    end
  end

  # GET /classifications/1/edit
  def edit
    @paramclassification_id = params[:params1]
    @classification = Classification.find(params[:id])
  end

  # POST /classifications
  # POST /classifications.json
  def create
    @paramclassification_id = params[:classification][:classification_heading_id]
    @classification = Classification.new(:classification_heading_id => @paramclassification_id,:classification_name => params[:classification][:classification_name] )

    respond_to do |format|
      if @classification.save
        format.html { redirect_to classifications_path(:params1 => @paramclassification_id), notice: 'Classification was successfully created.' }
        format.json { render json: @classification, status: :created, location: @classification }
      else
        format.html { render action: "new" }
        format.json { render json: @classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /classifications/1
  # PUT /classifications/1.json
  def update
    @classification = Classification.find(params[:id])
    @paramclassification_id = params[:classification][:classification_heading_id]
    respond_to do |format|
      if @classification.update_attributes(params[:classification])
        format.html { redirect_to classifications_url(:params1 => @paramclassification_id), notice: 'Classification was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classifications/1
  # DELETE /classifications/1.json
  def destroy

    @classification = Classification.find(params[:id])
    @paramclassification_id = @classification.classification_heading_id
    @classification.destroy

    respond_to do |format|
      format.html { redirect_to classifications_url(:params1 => @paramclassification_id), notice: 'Classification was successfully Destroyed.'  }
      format.json { head :ok }
    end
  end
end
