class CompanyDocumentsController < ApplicationController
  # GET /company_documents/new
  # GET /company_documents/new.json
  def new
    @company=Company.find(params[:id])
    @company_document = @company.company_documents.new
    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @company_document }
    end
  end

  # POST /company_documents
  # POST /company_documents.json
  def create
    @vars=params[:company_document]
    @company=Company.find(@vars[:company_id])
    @company_document=@company.company_documents.build(@vars)
    respond_to do |format|
      if @company_document.save
        format.html { redirect_to documents_list_companies_path(:id => @vars[:company_id]), notice: 'Company document was successfully created.' }
        format.json { render json: @company_document, status: :created, location: @company_document }
      else
        format.html { render action: "new"}
        format.json { render json: @company_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_documents/1
  # DELETE /company_documents/1.json
  def destroy

    @company_document = CompanyDocument.find(params[:id])
    #puts @company_document.inspect
    @company_document.destroy

    respond_to do |format|
      format.html { redirect_to documents_list_companies_path(:id => @company_document.company_id) }
      format.json { head :no_content }
    end
  end

  def download
      file = CompanyDocument.find(params[:id])
      send_file  file.file_path.path,
  		:filename => file.file_path_file_name,
      :type => file.file_path_content_type,
  		:disposition => 'inline'
      flash[:notice] = "Your file has been downloaded"
   end
end
