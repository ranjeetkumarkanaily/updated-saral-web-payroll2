class EsiDetailsController < ApplicationController
  # GET /esi_details/new
  # GET /esi_details/new.json
  def new
    @branch = Branch.find(params[:branch_id])
    @esi_details = Branch.find(params[:branch_id]).esi_details.order("created_at DESC")
    @esi_detail = @branch.esi_details.build

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @esi_detail }
    end
  end

  # GET /esi_details/1/edit
  def edit
    @esi_detail = EsiDetail.find(params[:id])
    @branch = @esi_detail.branch
  end

  # POST /esi_details
  # POST /esi_details.json
  def create
    @branch = Branch.find(params[:branch_id])
    @esi_detail = @branch.esi_details.build(params[:esi_detail])
    respond_to do |format|
      if @esi_detail.save
        # updating Branch pf_group_id
        @branch.update_esi_group
        format.html { redirect_to new_branch_esi_detail_path(@branch), notice: 'Esi detail was successfully created.' }
        format.json { render json: @esi_detail, status: :created, location: @esi_detail }
      else
        @esi_details = Branch.find(params[:branch_id]).esi_details
        format.html { render action: "new" }
        format.json { render json: @esi_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /esi_details/1
  # PUT /esi_details/1.json
  def update
    @esi_detail = EsiDetail.find(params[:id])

    respond_to do |format|
      if @esi_detail.update_attributes(params[:esi_detail])
        # updating Branch pf_group_id
        @esi_detail.branch.update_esi_group
        format.html { redirect_to new_branch_esi_detail_path(@esi_detail.branch), notice: 'Esi detail was successfully updated.' }
        format.json { head :no_content }
      else
        @branch = @esi_detail.branch
        format.html { render action: "edit" }
        format.json { render json: @esi_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /esi_details/1
  # DELETE /esi_details/1.json
  def destroy
    @branch = Branch.find(params[:branch_id])
    @esi_detail = EsiDetail.find(params[:id])
    @esi_detail.destroy
    @branch.update_esi_group

    respond_to do |format|
      format.html { redirect_to new_branch_esi_detail_path(@branch) }
      format.json { head :no_content }
    end
  end
end
