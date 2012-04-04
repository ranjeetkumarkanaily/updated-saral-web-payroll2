class PfGroupsController < ApplicationController

  before_filter :find_pf_group, :only => [:edit, :update, :destroy]

  def index
    @pf_groups = PfGroup.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @pf_groups }
    end
  end

  def new
    @pf_group = PfGroup.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @pf_group }
    end
  end

  def create
    @pf_group = PfGroup.new(params[:pf_group])

    respond_to do |format|
      if @pf_group.save
        format.html { redirect_to pf_groups_url, notice: 'Pf group was successfully created.' }
        format.json { render json: @pf_group, status: :created, location: @pf_group }
      else
        format.html { render action: "new" }
        format.json { render json: @pf_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pf_group.update_attributes(params[:pf_group])
        format.html { redirect_to pf_groups_url, notice: 'Pf group was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @pf_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pf_group.destroy

    respond_to do |format|
      format.html { redirect_to pf_groups_url }
      format.json { head :ok }
    end
  end

  protected
    def find_pf_group
      @pf_group = PfGroup.find(params[:id])
    end
end
