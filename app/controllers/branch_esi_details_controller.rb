class BranchEsiDetailsController < ApplicationController

  def new
    @branch = Branch.find(params[:branch_id])
    @branch_esi_detail = BranchEsiDetail.new
    @branch_esi_details = BranchEsiDetail.find_all_by_branch_id(params[:branch_id],:order => 'created_at DESC')
    @esi_groups = EsiGroup.all
  end

  def create
    @branch_esi_detail = BranchEsiDetail.new(params[:branch_esi_detail])
    @branch = @branch_esi_detail.branch
    if @branch_esi_detail.save
      # updating Branch pt_group_id
      @branch.update_esi_group
      redirect_to new_branch_esi_detail_path(:branch_id => @branch_esi_detail.branch_id), notice: 'Branch ESI Details was successfully updated.'
    else
      @branch_esi_details = BranchEsiDetail.find_all_by_branch_id(@branch.id,:order => 'created_at DESC')
      render 'new'
    end
  end

  def edit
    @branch_esi_detail = BranchEsiDetail.find(params[:id])
  end

  def update
    @branch_esi_detail = BranchEsiDetail.find(params[:id])
    respond_to do |format|
      if @branch_esi_detail.update_attributes(params[:branch_esi_detail])
        # updating Branch pf_group_id
        @branch_esi_detail.branch.update_esi_group
        format.html { redirect_to new_branch_esi_detail_path(:branch_id => @branch_esi_detail.branch_id),  notice: 'Branch ESI Details was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render 'edit' }
        format.json { render json: @branch_esi_detail.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @branch_esi_detail = BranchEsiDetail.find(params[:id])
    @branch_id = @branch_esi_detail.branch_id
    @branch_esi_detail.destroy
    Branch.find(@branch_id).update_esi_group
    respond_to do |format|
      format.html { redirect_to new_branch_esi_detail_path(:branch_id => @branch_id) }
      format.json { head :ok }
    end
  end

end
