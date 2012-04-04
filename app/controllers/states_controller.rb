class StatesController < ApplicationController

  before_filter :find_state, :only => [:edit, :update, :destroy]

  def index
    @states = State.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @states }
    end
  end

  def new
    @state = State.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @state }
    end
  end

  def create
    @state = State.new(params[:state])

    respond_to do |format|
      if @state.save
        format.html { redirect_to states_url, notice: 'State was successfully created.' }
        format.json { render json: @state, status: :created, location: @state }
      else
        format.html { render 'new' }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @state.update_attributes(params[:state])
        format.html { redirect_to states_url, notice: 'State was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render 'edit' }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @state.destroy

    respond_to do |format|
      format.html { redirect_to states_url }
      format.json { head :ok }
    end
  end

  protected
    def find_state
      @state = State.find(params[:id])
    end
end
