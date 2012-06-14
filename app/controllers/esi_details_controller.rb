class EsiDetailsController < ApplicationController
  # GET /esi_details/new
  # GET /esi_details/new.json
  before_filter :find_branch, :only => [:new, :create, :destroy]
  before_filter :find_esi_detail, :only => [:edit, :update, :destroy]

  def new
    @esi_details = Branch.find(params[:branch_id]).esi_details.order("created_at DESC")
    @esi_detail = @branch.esi_details.build

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @esi_detail }
    end
  end

  # GET /esi_details/1/edit
  def edit
    @branch = @esi_detail.branch
  end

  # POST /esi_details
  # POST /esi_details.json
  def create
    esi_det=params[:esi_detail]
    date_format=OptionSetting.date_format_value
    if date_format == "%m-%Y-%d" || date_format == "%m/%d/%Y" || date_format == "%d/%m/%y" || date_format == "%d-%m-%y"
      dates_value=[esi_det[:esi_effective_date]]
      dates=OptionSetting.convert_date(dates_value)
      val=esi_det.merge!(:esi_effective_date=>dates[0])
      @esi_detail = @branch.esi_details.build(val)
    else
      @esi_detail = @branch.esi_details.build(params[:esi_detail])
    end

    #@esi_detail = @branch.esi_details.build(params[:esi_detail])
    respond_to do |format|
      if @esi_detail.save
        # updating Branch pf_group_id
        @branch.update_esi_group
        format.html { redirect_to new_branch_esi_detail_path(@branch), notice: 'Esi detail was successfully created.' }
        format.json { render json: @esi_detail, status: :created, location: @esi_detail }
      else
        @esi_details = Branch.find(params[:branch_id]).esi_details
        format.html { render "new" }
        format.json { render json: @esi_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /esi_details/1
  # PUT /esi_details/1.json
  def update
    date_format=OptionSetting.date_format_value
    if date_format == "%m-%Y-%d" || date_format == "%m/%d/%Y" || date_format == "%d/%m/%y" || date_format == "%d-%m-%y"
      dates_value=[params[:esi_detail][:esi_effective_date]]
      dates=OptionSetting.convert_date(dates_value)
      params[:esi_detail].merge!(:esi_effective_date=>dates[0])
    else
      params[:esi_detail]
    end
    respond_to do |format|
      if @esi_detail.update_attributes(params[:esi_detail])
        # updating Branch pf_group_id
        @esi_detail.branch.update_esi_group
        format.html { redirect_to new_branch_esi_detail_path(@esi_detail.branch), notice: 'Esi detail was successfully updated.' }
        format.json { head :no_content }
      else
        @branch = @esi_detail.branch
        format.html { render "edit" }
        format.json { render json: @esi_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /esi_details/1
  # DELETE /esi_details/1.json
  def destroy
    @esi_detail.destroy
    @branch.update_esi_group

    respond_to do |format|
      format.html { redirect_to new_branch_esi_detail_path(@branch) }
      format.json { head :no_content }
    end
  end


  protected
    def find_branch
      @branch = Branch.find(params[:branch_id])
    end

    def find_esi_detail
      @esi_detail = EsiDetail.find(params[:id])
    end
end
