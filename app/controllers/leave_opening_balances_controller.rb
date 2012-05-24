class LeaveOpeningBalancesController < ApplicationController

  def upload
    @opbal = LeaveOpeningBalance.first
  end

  def save_uploaded_data
    excel_file = params[:excel_file]
    file = FileUploader.new
    file.store!(excel_file)
    book = Spreadsheet.open "#{file.store_path}"
    sheet1 = book.worksheet 0
    sheet1.each 1 do |row|
      @opbal = LeaveOpeningBalance.new(:employee_id => row[0], :leave_definition_id => row[1],:opening_balance => row[2])
      @opbal.save
    end
    respond_to do |format|
      if @opbal.errors.messages.blank?
        format.html { redirect_to upload_leave_opening_balances_path, notice: 'Leave opening balance was successfully uploaded.' }
      else
        format.html { redirect_to upload_leave_opening_balances_path, notice: 'Leave opening balance Details already exist for the same Employee/s.' }
      end
    end
  end
end
