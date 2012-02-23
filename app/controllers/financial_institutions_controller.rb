class FinancialInstitutionsController < ApplicationController
  # GET /financial_institutions
  # GET /financial_institutions.json
  def index
    @financial_institutions = FinancialInstitution.where('id>1').order('created_at ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @financial_institutions }
    end
  end

  # GET /financial_institutions/1
  # GET /financial_institutions/1.json
  def show
    @financial_institution = FinancialInstitution.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @financial_institution }
    end
  end

  # GET /financial_institutions/new
  # GET /financial_institutions/new.json
  def new
    @financial_institution = FinancialInstitution.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @financial_institution }
    end
  end

  # GET /financial_institutions/1/edit
  def edit
    @financial_institution = FinancialInstitution.find(params[:id])
  end

  # POST /financial_institutions
  # POST /financial_institutions.json
  def create
    @financial_institution = FinancialInstitution.new(params[:financial_institution])

    respond_to do |format|
      if @financial_institution.save
        format.html { redirect_to @financial_institution, notice: 'Financial institution was successfully created.' }
        format.json { render json: @financial_institution, status: :created, location: @financial_institution }
      else
        format.html { render action: "new" }
        format.json { render json: @financial_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /financial_institutions/1
  # PUT /financial_institutions/1.json
  def update
    @financial_institution = FinancialInstitution.find(params[:id])

    respond_to do |format|
      if @financial_institution.update_attributes(params[:financial_institution])
        format.html { redirect_to @financial_institution, notice: 'Financial institution was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @financial_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financial_institutions/1
  # DELETE /financial_institutions/1.json
  def destroy
    @financial_institution = FinancialInstitution.find(params[:id])
    @financial_institution.destroy

    respond_to do |format|
      format.html { redirect_to financial_institutions_url }
      format.json { head :ok }
    end
  end
end
