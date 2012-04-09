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

    #@leaves = []
    #@errors = Hash.new
    #@counter = 0
    #sheet1.each 1 do |row|
    #  @counter+=1
    #
    #  l = LeaveDetail.new
    #  l.employee_id = Employee.find_by_refno("#{row[0]}").id
    #  l.leave_date = row[1]
    #
    #  if l.valid?
    #    @leaves << l
    #  else
    #    @errors["#{@counter+1}"] = l.errors
    #  end
    #end

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
