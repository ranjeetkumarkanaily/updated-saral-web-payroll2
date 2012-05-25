class LeaveDetailsController < ApplicationController
  def upload

  end

  def index
    @leave_details = LeaveDetail.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @leave_detail = LeaveDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @leave_details }
    end
  end

  def create
    @leave_detail = LeaveDetail.new(params[:leave_detail])

    respond_to do |format|
      if @leave_detail.save
        format.html { redirect_to leave_details_url, notice: 'Leave Details was successfully created.' }
        format.json { render json: leave_details_url, status: :created, location: leave_detail_url }
      else
        format.html { render action: "new" }
        format.json { render json: leave_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @leave_detail = LeaveDetail.find(params[:id])
  end

  def update
    @leave_detail = LeaveDetail.find(params[:id])

    respond_to do |format|
      if @leave_detail.update_attributes(params[:leave_detail])
        format.html { redirect_to leave_details_url, notice: 'Leave detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @leave_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @leave_detail = LeaveDetail.find(params[:id])
    @leave_detail.destroy

    respond_to do |format|
      format.html { redirect_to leave_details_url }
      format.json { head :no_content }
    end
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
               :handlers => [:haml],
               :format => [:xls],
               :template => 'leave_details/generate_sample_excel_template'
      end
    end
  end

end
