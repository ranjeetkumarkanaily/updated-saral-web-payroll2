class ClassificationsController < ApplicationController

  before_filter :accept_param, :only => [:index, :new, :edit]
  before_filter :find_classification, :only => [:update, :destroy]

  def index
    @classifications = Classification.where(:classification_heading_id => @paramclassification_id).order('created_at ASC').paginate(:page => params[:page], :per_page => 10)
    @heading_name = ClassificationHeading.find(@paramclassification_id).classification_heading_name
    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @classifications }
    end
  end

  def new
    @classification = Classification.new
    @heading_name = ClassificationHeading.find(@paramclassification_id).classification_heading_name
    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @classification }
    end
  end

  def edit
    @classification = Classification.find(params[:id])
  end

  def create
    @paramclassification_id = params[:classification][:classification_heading_id]
    @classification = Classification.new(:classification_heading_id => @paramclassification_id,:classification_name => params[:classification][:classification_name] )

    respond_to do |format|
      if @classification.save
        format.html { redirect_to classifications_path(:params1 => @paramclassification_id), notice: 'Classification was successfully created.' }
        format.json { render json: @classification, status: :created, location: @classification }
      else
        format.html { render 'new' }
        format.json { render json: @classification.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @paramclassification_id = params[:classification][:classification_heading_id]
    respond_to do |format|
      if @classification.update_attributes(params[:classification])
        format.html { redirect_to classifications_url(:params1 => @paramclassification_id), notice: 'Classification was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render 'edit' }
        format.json { render json: @classification.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @paramclassification_id = @classification.classification_heading_id
    @classification.destroy

    respond_to do |format|
      format.html { redirect_to classifications_url(:params1 => @paramclassification_id), notice: 'Classification was successfully Destroyed.'  }
      format.json { head :ok }
    end
  end

  protected
    def accept_param
      @paramclassification_id = params[:params1]
    end

    def find_classification
      @classification = Classification.find(params[:id])
    end
end
