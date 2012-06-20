class FinancialInstitutionsController < ApplicationController

  before_filter :find_financial_institution, :only => [:show, :edit, :update, :destroy]

  def index
    @financial_institutions = FinancialInstitution.where('id>1').order('created_at ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @financial_institutions }
    end
  end

  def edit

  end

  def show
    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @financial_institution }
    end
  end

  def new
    @financial_institution = FinancialInstitution.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @financial_institution }
    end
  end

  def create
    @financial_institution = FinancialInstitution.new(params[:financial_institution])

    respond_to do |format|
      if @financial_institution.save
        format.html { redirect_to @financial_institution, notice: 'Financial institution was successfully created.' }
        format.json { render json: @financial_institution, status: :created, location: @financial_institution }
      else
        format.html { render 'new' }
        format.json { render json: @financial_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @financial_institution.update_attributes(params[:financial_institution])
        format.html { redirect_to @financial_institution, notice: 'Financial institution was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render 'edit' }
        format.json { render json: @financial_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    begin
      @financial_institution.destroy
      flash[:notice] = "Successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @financial_institution.errors.add(:base, e)
      flash[:error] = "Selected Financial Institution is assigned. Not allow to delete."
    ensure
      respond_to do |format|
        format.html { redirect_to financial_institutions_url }
        format.json { head :ok }
      end
    end

  end

  protected
    def find_financial_institution
      @financial_institution = FinancialInstitution.find(params[:id])
    end
end
