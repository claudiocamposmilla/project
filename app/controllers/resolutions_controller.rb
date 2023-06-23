class ResolutionsController < ApplicationController
  before_action :set_resolution, only: %i[ show edit update destroy ]
  load_and_authorize_resource
  # GET /resolutions or /resolutions.json
  def index
    @resolutions = Resolution.all

  end

  # GET /resolutions/1 or /resolutions/1.json
  def show
    @resolution = Resolution.find(params[:id])
    @users = @resolution.users
    @user = current_user
  end

  # GET /resolutions/new
  def new
    @resolution = Resolution.new
  end

  # GET /resolutions/1/edit
  def edit
    @resolution = Resolution.find(params[:id])
    @users = @resolution.users
    @user = current_user
  end

  # POST /resolutions or /resolutions.json
  def create
    @resolution = Resolution.new(resolution_params)

    respond_to do |format|
      if @resolution.save
        format.html { redirect_to resolution_url(@resolution), notice: "Resolution was successfully created." }
        format.json { render :show, status: :created, location: @resolution }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resolutions/1 or /resolutions/1.json
  def update
    respond_to do |format|
      if @resolution.update(resolution_params)
        format.html { redirect_to resolution_url(@resolution), notice: "Resolution was successfully updated." }
        format.json { render :show, status: :ok, location: @resolution }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resolutions/1 or /resolutions/1.json
  def destroy
    @resolution.destroy

    respond_to do |format|
      format.html { redirect_to resolutions_url, notice: "Resolution was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resolution
      @resolution = Resolution.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resolution_params
      params.require(:resolution).permit(:ticket_id, :resolved, :evaluation, :resolution_comment, :user_body)
    end
end
