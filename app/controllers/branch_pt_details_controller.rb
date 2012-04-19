class BranchPtDetailsController < ApplicationController
  def new
    @branch_pt_detail = BranchPtDetail.new
    @branch = Branch.find(params[:branch_id])
    @branch_pt_details = BranchPtDetail.find_all_by_branch_id(params[:branch_id],:order => 'created_at DESC')
    @pt_groups = PtGroup.all
  end

  def create
    @branch_pt_detail = BranchPtDetail.new(params[:branch_pt_detail])
    @branch = @branch_pt_detail.branch
    if @branch_pt_detail.save
      # updating Branch pt_group_id
      @branch.update_pt_group
      redirect_to new_branch_pt_detail_path(:branch_id => @branch_pt_detail.branch_id), notice: 'Branch PT Details was successfully updated.'
    else
      @branch_pt_details = BranchPtDetail.find_all_by_branch_id(@branch.id,:order => 'created_at DESC')
      render 'new'
    end
  end

  def edit
    @branch_pt_detail = BranchPtDetail.find(params[:id])
  end

  def update
    @branch_pt_detail = BranchPtDetail.find(params[:id])
    respond_to do |format|
      if @branch_pt_detail.update_attributes(params[:branch_pt_detail])
        # updating Branch pf_group_id
        @branch_pt_detail.branch.update_pt_group
        format.html { redirect_to new_branch_pt_detail_path(:branch_id => @branch_pt_detail.branch_id),  notice: 'Branch PT Details was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render 'edit' }
        format.json { render json: @branch_pt_detail.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @branch_pt_detail = BranchPtDetail.find(params[:id])
    @branch_id = @branch_pt_detail.branch_id
    @branch_pt_detail.destroy
    Branch.find(@branch_id).update_pt_group
    respond_to do |format|
      format.html { redirect_to new_branch_pt_detail_path(:branch_id => @branch_id) }
      format.json { head :ok }
    end
  end
end