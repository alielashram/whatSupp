class StatusesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  before_action :set_status, only: [:edit, :update, :destroy]



  # GET /statuses
  # GET /statuses.json
  def index
    @statuses = Status.all
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
    @status = Status.find(params[:id])
  end

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit
  end

  # POST /statuses
  # POST /statuses.json
  def create
    @status = current_user.statuses.build(status_params)

    respond_to do |format|
      if @status.save
        format.html { redirect_to @status, notice: 'Status was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /statuses/1
  # PATCH/PUT /statuses/1.json
  def update
    respond_to do |format|
      if @status.update(status_params)
        format.html { redirect_to @status, notice: 'Status was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @status.destroy
    respond_to do |format|
        format.html { redirect_to statuses_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_status
     # @status = current_user.statuses.find(params[:id])
    #end
    

    def set_status
      if current_user.admin? 
        @status = statuses.find(params[:id])
      else
        @status = current_user.statuses.find(params[:id])
      end
    end

    def statuses
      @statuses = Status.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_params
      params.require(:status).permit(:supplication, :user_id)
    end

end
