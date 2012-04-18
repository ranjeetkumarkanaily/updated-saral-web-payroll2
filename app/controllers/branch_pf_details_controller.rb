class BranchPfDetailsController < ApplicationController

  def new
    @branch = Branch.find(params[:branch_id])
    @branch_pf_detail = BranchPfDetail.new
    @branch_pf_details = BranchPfDetail.find_all_by_branch_id(params[:branch_id],:order => 'created_at DESC')
    @pf_groups = PfGroup.all
  end

  def create
    @branch_pf_detail = BranchPfDetail.new(params[:branch_pf_detail])
    @branch = @branch_pf_detail.branch
    if @branch_pf_detail.save
      redirect_to new_branch_pf_detail_path(:branch_id => @branch_pf_detail.branch_id), notice: 'Branch PF Details was successfully updated.'
    else
      @branch_pf_details = BranchPfDetail.find_all_by_branch_id(@branch.id,:order => 'created_at DESC')
      render 'new'
    end
  end

  def edit
    @branch_pf_detail = BranchPfDetail.find(params[:id])
  end

  def update
    @branch_pf_detail = BranchPfDetail.find(params[:id])
    respond_to do |format|
      if @branch_pf_detail.update_attributes(params[:branch_pf_detail])
        format.html { redirect_to new_branch_pf_detail_path(:branch_id => @branch_pf_detail.branch_id),  notice: 'Branch PF Details was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render 'edit' }
        format.json { render json: @branch_pf_detail.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @branch_pf_detail = BranchPfDetail.find(params[:id])
    @branch_id = @branch_pf_detail.branch_id
    @branch_pf_detail.destroy
    respond_to do |format|
      format.html { redirect_to new_branch_pf_detail_path(:branch_id => @branch_id) }
      format.json { head :ok }
    end
  end
end