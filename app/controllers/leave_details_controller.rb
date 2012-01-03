class LeaveDetailsController < ApplicationController
  def upload

  end

  def index
    @leave_details = LeaveDetail.all
  end

  def upload_parse_validate
    excel_file = params[:excel_file]
    file = FileUploader.new
    file.store!(excel_file)
    book = Spreadsheet.open "#{file.store_path}"
    sheet1 = book.worksheet 0
    @leaves = []
    @errors = Hash.new
    @counter = 0
    sheet1.each 1 do |row|
      @counter+=1

      l = LeaveDetail.new
      l.employee_id = row[0]
      l.leave_date = row[1]

      if l.valid?
        @leaves << l
      else
        @errors["#{@counter+1}"] = l.errors
      end
    end
    file.remove!
  end

  def save
    params[:leave_details].each do |leave|
      LeaveDetail.create(leave)
    end
    redirect_to leave_details_path
  end

end
