class LeaveDetailsController < ApplicationController
  def upload

  end

  def index
    @leave_details = LeaveDetail.paginate(:page => params[:page], :per_page => 10)
  end

  def upload_parse_validate
    excel_file = params[:excel_file]
    file = FileUploader.new
    file.store!(excel_file)
    book = Spreadsheet.open "#{file.store_path}"
    sheet1 = book.worksheet 0

    @leaves = LeaveDetail.process_leaves_excel_sheet sheet1

    file.remove!
  end

  def save
    params[:leave_details].each do |leave|
      LeaveDetail.create(leave)
    end
    redirect_to leave_details_path
  end

  def generate_sample_excel_template
    respond_to do |format|
      format.xls do
        render :xls => 'Leaves Template',
               :template => 'leave_details/generate_sample_excel_template.xls.haml'
      end
    end
  end

end
