class PfDetailsController < ApplicationController
  # GET /pf_details/new
  # GET /pf_details/new.json
  def new
    @branch = Branch.find(params[:branch_id])
    @pf_details = Branch.find(params[:branch_id]).pf_details.order("created_at DESC")
    @pf_detail = @branch.pf_details.build

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @pf_detail }
    end
  end

  # GET /pf_details/1/edit
  def edit
    @pf_detail = PfDetail.find(params[:id])
    @branch = @pf_detail.branch
  end

  # POST /pf_details
  # POST /pf_details.json
  def create
    @branch = Branch.find(params[:branch_id])
    @pf_detail = @branch.pf_details.build(params[:pf_detail])
    respond_to do |format|
      if @pf_detail.save
        # updating Branch pf_group_id
        @branch.update_pf_group
        format.html { redirect_to new_branch_pf_detail_path(@branch), notice: 'Pf detail was successfully created.' }
        format.json { render json: @pf_detail, status: :created, location: @pf_detail }
      else
        @pf_details = Branch.find(params[:branch_id]).pf_details
        format.html { render action: "new" }
        format.json { render json: @pf_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pf_details/1
  # PUT /pf_details/1.json
  def update
    @pf_detail = PfDetail.find(params[:id])

    respond_to do |format|
      if @pf_detail.update_attributes(params[:pf_detail])
        # updating Branch pf_group_id
        @pf_detail.branch.update_pf_group
        format.html { redirect_to new_branch_pf_detail_path(@pf_detail.branch), notice: 'Pf detail was successfully updated.' }
        format.json { head :no_content }
      else
        @branch = @pf_detail.branch
        format.html { render action: "edit" }
        format.json { render json: @pf_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pf_details/1
  # DELETE /pf_details/1.json
  def destroy
    @branch = Branch.find(params[:branch_id])
    @pf_detail = PfDetail.find(params[:id])
    @pf_detail.destroy
    @branch.update_pf_group

    respond_to do |format|
      format.html { redirect_to new_branch_pf_detail_path(@branch) }
      format.json { head :no_content }
    end
  end
end
