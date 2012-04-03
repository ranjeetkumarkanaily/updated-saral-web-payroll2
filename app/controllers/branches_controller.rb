class BranchesController < ApplicationController

  before_filter :find_branch, :only => [:show, :edit, :update, :destroy]

  def index
    @branches = Branch.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @branches }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @branch }
    end
  end

  def new
    @branch = Branch.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @branch }
    end
  end

  def create
    @branch = Branch.new(params[:branch])

    respond_to do |format|
      if @branch.save
        format.html { redirect_to @branch, notice: 'Branch was successfully created.' }
        format.json { render json: @branch, status: :created, location: @branch }
      else
        format.html { render action: "new" }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @branch.update_attributes(params[:branch])
        format.html { redirect_to @branch, notice: 'Branch was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @branch.destroy

    respond_to do |format|
      format.html { redirect_to branches_url }
      format.json { head :ok }
    end
  end

  protected
    def find_branch
      @branch = Branch.find(params[:id])
    end
end
