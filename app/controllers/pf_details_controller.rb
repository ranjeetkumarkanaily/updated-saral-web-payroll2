class PfDetailsController < ApplicationController
  # GET /pf_details/new
  # GET /pf_details/new.json

  before_filter :find_branch, :only => [:new, :create, :destroy]
  before_filter :find_pf_detail, :only => [:edit, :update, :destroy]

  def new
    @pf_details = Branch.find(params[:branch_id]).pf_details.order("created_at DESC")
    @pf_detail = @branch.pf_details.build

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @pf_detail }
    end
  end

  # GET /pf_details/1/edit
  def edit
    @branch = @pf_detail.branch
  end

  # POST /pf_details
  # POST /pf_details.json
  def create
    pf_det=params[:pf_detail]
    date_format=OptionSetting.date_format_value
    if date_format == "%m-%Y-%d" || date_format == "%m/%d/%Y" || date_format == "%d/%m/%y" || date_format == "%d-%m-%y"
      dates_value=[pf_det[:pf_effective_date]]
      dates=OptionSetting.convert_date(dates_value)
      val=pf_det.merge!(:pf_effective_date=>dates[0])
      @pf_detail = @branch.pf_details.build(val)
    else
      @pf_detail = @branch.pf_details.build(params[:pf_detail])
    end

    respond_to do |format|
      if @pf_detail.save
        # updating Branch pf_group_id
        @branch.update_pf_group
        format.html { redirect_to new_branch_pf_detail_path(@branch), notice: 'Pf detail was successfully created.' }
        format.json { render json: @pf_detail, status: :created, location: @pf_detail }
      else
        @pf_details = Branch.find(params[:branch_id]).pf_details
        format.html { render "new" }
        format.json { render json: @pf_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pf_details/1
  # PUT /pf_details/1.json
  def update

    date_format=OptionSetting.date_format_value
    if date_format == "%m-%Y-%d" || date_format == "%m/%d/%Y" || date_format == "%d/%m/%y" || date_format == "%d-%m-%y"
      dates_value=[params[:pf_detail][:pf_effective_date]]
      dates=OptionSetting.convert_date(dates_value)
      params[:pf_detail].merge!(:pf_effective_date=>dates[0])
    else
      params[:pf_detail]
    end
    respond_to do |format|
      if @pf_detail.update_attributes(params[:pf_detail])
        # updating Branch pf_group_id
        @pf_detail.branch.update_pf_group
        format.html { redirect_to new_branch_pf_detail_path(@pf_detail.branch), notice: 'Pf detail was successfully updated.' }
        format.json { head :no_content }
      else
        @branch = @pf_detail.branch
        format.html { render "edit" }
        format.json { render json: @pf_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pf_details/1
  # DELETE /pf_details/1.json
  def destroy
    @pf_detail.destroy
    @branch.update_pf_group

    respond_to do |format|
      format.html { redirect_to new_branch_pf_detail_path(@branch) }
      format.json { head :no_content }
    end
  end

  protected
    def find_branch
      @branch = Branch.find(params[:branch_id])
    end

    def find_pf_detail
      @pf_detail = PfDetail.find(params[:id])
    end
end
