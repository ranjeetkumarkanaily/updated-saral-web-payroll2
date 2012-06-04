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
    @backup_utils = BackupUtility.all
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
    @bkup_util = BackupUtility.find_by_file_name(dump_file.original_filename)
    if @bkup_util
      @file = FileUploader.new
      @file.store!(dump_file)
    end
  end
  def restore_backup
    file = params[:file]
    bkup_optn = params[:backup_option]
    Company.restore_db file, bkup_optn
    FileUtils.remove_file(file, force = true)
    redirect_to companies_path
  end
end
