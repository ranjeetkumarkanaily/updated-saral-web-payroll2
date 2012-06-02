class CompaniesController < ApplicationController
  add_breadcrumb "Settings", :root_path

  def index
    @company = Company.count ==0 ? nil : Company.first
    add_breadcrumb "Company", companies_path
  end

  def new
    @company = Company.new
    add_breadcrumb "Company", companies_path
    add_breadcrumb "New Company", new_company_path
  end

  def edit
    @company = Company.find(params[:id])
    add_breadcrumb "Company", companies_path
    add_breadcrumb "Edit Company", edit_company_path(@company)
  end

  def create
    @company = Company.new(params[:company])
    respond_to do |format|
      if @company.save
        format.html { redirect_to companies_path, notice: 'Company was successfully created.' }
      else
        format.html { render 'new' }
      end
    end
  end

  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to companies_path, notice: 'Company was successfully updated.' }
      else
        format.html { render 'edit' }
      end
    end
  end

  def documents_list
     @company=Company.find(params[:id])
     @list=@company.company_documents
  end

  def backup
    @company = Company.count ==0 ? nil : Company.first
  end

  def backup_option
    file_path = Company.backup_db params[:backup_option]
    send_file  file_path.path,
               :filename => File.basename(file_path),
               :type => File.ftype(file_path),
               :disposition => 'attachment'
    FileUtils.rm_r(file_path.path)
  end

  def upload

  end

  def restore
    dump_file = params[:dump_file]
    file = FileUploader.new
    file.store!(dump_file)
    delete_all_tables
    Company.restore_db file.path
    file.remove!
    redirect_to companies_path
  end
  private
    def delete_all_tables
      conn = ActiveRecord::Base.connection
      tables = conn.execute("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';").map { |r| r["table_name"] }
      tables.each { |t| conn.execute("DROP TABLE IF EXISTS #{t} CASCADE")}
    end
end
