class PfGroupsController < ApplicationController
  # GET /pf_groups
  # GET /pf_groups.json
  def index
    @pf_groups = PfGroup.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @pf_groups }
    end
  end

  # GET /pf_groups/1
  # GET /pf_groups/1.json
  def show
    @pf_group = PfGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @pf_group }
    end
  end

  # GET /pf_groups/new
  # GET /pf_groups/new.json
  def new
    @pf_group = PfGroup.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @pf_group }
    end
  end

  # GET /pf_groups/1/edit
  def edit
    @pf_group = PfGroup.find(params[:id])
  end

  # POST /pf_groups
  # POST /pf_groups.json
  def create
    @pf_group = PfGroup.new(params[:pf_group])

    respond_to do |format|
      if @pf_group.save
        format.html { redirect_to @pf_group, notice: 'Pf group was successfully created.' }
        format.json { render json: @pf_group, status: :created, location: @pf_group }
      else
        format.html { render action: "new" }
        format.json { render json: @pf_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pf_groups/1
  # PUT /pf_groups/1.json
  def update
    @pf_group = PfGroup.find(params[:id])

    respond_to do |format|
      if @pf_group.update_attributes(params[:pf_group])
        format.html { redirect_to @pf_group, notice: 'Pf group was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @pf_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pf_groups/1
  # DELETE /pf_groups/1.json
  def destroy
    @pf_group = PfGroup.find(params[:id])
    @pf_group.destroy

    respond_to do |format|
      format.html { redirect_to pf_groups_url }
      format.json { head :ok }
    end
  end
end
