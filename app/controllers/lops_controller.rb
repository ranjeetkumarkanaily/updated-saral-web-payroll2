class LopsController < ApplicationController

  def file_upload
    @lines = parse_csv_file(params['my_file'].tempfile)
  end

  def create
    #params[:lines].each do |line|
    #  if check_duplicate_lop?(line[:employee_id], line[:month_year])
    #    Lop.delete_all(:employee_id => line[:employee_id], :month_year => line[:month_year])
    #  end
    #  Lop.create(line)
    #end
    #redirect_to new_salary_path
  end

  private
  def parse_csv_file(path_to_csv)
    lines = []
    require 'csv'
    CSV.foreach(path_to_csv) do |row|
      lines << row
    end
    lines
  end

  #def check_duplicate_lop?(employee_id, month_year)
  #  Lop.find_by_employee_id_and_month_year(employee_id, month_year)
  #end

end