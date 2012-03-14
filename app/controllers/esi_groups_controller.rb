class EsiGroupsController < ApplicationController
  # GET /esi_groups
  # GET /esi_groups.json
  def index
    @esi_groups = EsiGroup.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @esi_groups }
    end
  end

  # GET /esi_groups/1
  # GET /esi_groups/1.json
  def show
    @esi_group = EsiGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @esi_group }
    end
  end

  # GET /esi_groups/new
  # GET /esi_groups/new.json
  def new
    @esi_group = EsiGroup.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @esi_group }
    end
  end

  # GET /esi_groups/1/edit
  def edit
    @esi_group = EsiGroup.find(params[:id])
  end

  # POST /esi_groups
  # POST /esi_groups.json
  def create
    @esi_group = EsiGroup.new(params[:esi_group])

    respond_to do |format|
      if @esi_group.save
        format.html { redirect_to esi_groups_url, notice: 'Esi group was successfully created.' }
        format.json { render json: @esi_group, status: :created, location: @esi_group }
      else
        format.html { render action: "new" }
        format.json { render json: @esi_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /esi_groups/1
  # PUT /esi_groups/1.json
  def update
    @esi_group = EsiGroup.find(params[:id])

    respond_to do |format|
      if @esi_group.update_attributes(params[:esi_group])
        format.html { redirect_to esi_groups_url, notice: 'Esi group was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @esi_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /esi_groups/1
  # DELETE /esi_groups/1.json
  def destroy
    @esi_group = EsiGroup.find(params[:id])
    @esi_group.destroy

    respond_to do |format|
      format.html { redirect_to esi_groups_url }
      format.json { head :ok }
    end
  end
end
