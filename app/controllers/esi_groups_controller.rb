class EsiGroupsController < ApplicationController

  before_filter :find_esi_group, :only => [:edit, :update, :destroy]

  def index
    @esi_groups = EsiGroup.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @esi_groups }
    end
  end

  def edit

  end

  def new
    @esi_group = EsiGroup.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @esi_group }
    end
  end

  def create
    @esi_group = EsiGroup.new(params[:esi_group])

    respond_to do |format|
      if @esi_group.save
        format.html { redirect_to esi_groups_url, notice: 'Esi group was successfully created.' }
        format.json { render json: @esi_group, status: :created, location: @esi_group }
      else
        format.html { render 'new' }
        format.json { render json: @esi_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @esi_group.update_attributes(params[:esi_group])
        format.html { redirect_to esi_groups_url, notice: 'Esi group was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render 'edit' }
        format.json { render json: @esi_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @esi_group.destroy

    respond_to do |format|
      format.html { redirect_to esi_groups_url }
      format.json { head :ok }
    end
  end

  protected
    def find_esi_group
      @esi_group = EsiGroup.find(params[:id])
    end
end
