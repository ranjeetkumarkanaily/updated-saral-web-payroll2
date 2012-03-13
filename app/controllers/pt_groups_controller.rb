class PtGroupsController < ApplicationController
  # GET /pt_groups
  # GET /pt_groups.json
  def index
    @pt_groups = PtGroup.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @pt_groups }
    end
  end

  # GET /pt_groups/1
  # GET /pt_groups/1.json
  def show
    @pt_group = PtGroup.find(params[:id])
    @pt_group_rates = @pt_group.pt_group_rates.order('paymonth_id Desc')
    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @pt_group }
    end
  end

  # GET /pt_groups/new
  # GET /pt_groups/new.json
  def new
    @pt_group = PtGroup.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @pt_group }
    end
  end

  # GET /pt_groups/1/edit
  def edit
    @pt_group = PtGroup.find(params[:id])
  end

  # POST /pt_groups
  # POST /pt_groups.json
  def create
    @pt_group = PtGroup.new(params[:pt_group])

    respond_to do |format|
      if @pt_group.save
        format.html { redirect_to pt_groups_path, notice: 'Pt group was successfully created.' }
        format.json { render json: @pt_group, status: :created, location: @pt_group }
      else
        format.html { render action: "new" }
        format.json { render json: @pt_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pt_groups/1
  # PUT /pt_groups/1.json
  def update
    @pt_group = PtGroup.find(params[:id])

    respond_to do |format|
      if @pt_group.update_attributes(params[:pt_group])
        format.html { redirect_to @pt_group, notice: 'Pt group was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @pt_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pt_groups/1
  # DELETE /pt_groups/1.json
  def destroy
    @pt_group = PtGroup.find(params[:id])
    @pt_group.destroy

    respond_to do |format|
      format.html { redirect_to pt_groups_url }
      format.json { head :ok }
    end
  end
end
