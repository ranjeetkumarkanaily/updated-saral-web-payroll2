class PtDetailsController < ApplicationController
  # GET /pt_details/new
  # GET /pt_details/new.json
  def new
    @branch = Branch.find(params[:branch_id])
    @pt_details = Branch.find(params[:branch_id]).pt_details.order("created_at DESC")
    @pt_detail = @branch.pt_details.build

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @pt_detail }
    end
  end

  # GET /pt_details/1/edit
  def edit
    @pt_detail = PtDetail.find(params[:id])
    @branch = @pt_detail.branch
  end

  # POST /pt_details
  # POST /pt_details.json
  def create
    @branch = Branch.find(params[:branch_id])
    @pt_detail = @branch.pt_details.build(params[:pt_detail])
    respond_to do |format|
      if @pt_detail.save
        # updating Branch pf_group_id
        @branch.update_pt_group
        format.html { redirect_to new_branch_pt_detail_path(@branch), notice: 'Pt detail was successfully created.' }
        format.json { render json: @pt_detail, status: :created, location: @pt_detail }
      else
        @pt_details = Branch.find(params[:branch_id]).pt_details
        format.html { render action: "new" }
        format.json { render json: @pt_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pt_details/1
  # PUT /pt_details/1.json
  def update
    @pt_detail = PtDetail.find(params[:id])

    respond_to do |format|
      if @pt_detail.update_attributes(params[:pt_detail])
        # updating Branch pf_group_id
        @pt_detail.branch.update_pt_group
        format.html { redirect_to new_branch_pt_detail_path(@pt_detail.branch), notice: 'Pt detail was successfully updated.' }
        format.json { head :no_content }
      else
        @branch = @pt_detail.branch
        format.html { render action: "edit" }
        format.json { render json: @pt_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pt_details/1
  # DELETE /pt_details/1.json
  def destroy
    @branch = Branch.find(params[:branch_id])
    @pt_detail = PtDetail.find(params[:id])
    @pt_detail.destroy
    @branch.update_pt_group

    respond_to do |format|
      format.html { redirect_to new_branch_pt_detail_path(@branch) }
      format.json { head :no_content }
    end
  end
end
