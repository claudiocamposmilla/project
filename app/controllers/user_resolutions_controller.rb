class UserResolutionsController < ApplicationController
  before_action :set_user_resolution, only: %i[ show edit update destroy ]

  # GET /user_resolutions or /user_resolutions.json
  def index
    @user_resolutions = UserResolution.all
  end

  # GET /user_resolutions/1 or /user_resolutions/1.json
  def show
  end

  # GET /user_resolutions/new
  def new
    @user_resolution = UserResolution.new
  end

  # GET /user_resolutions/1/edit
  def edit
  end

  # POST /user_resolutions or /user_resolutions.json
  def create
    @user_resolution = UserResolution.new(user_resolution_params)

    respond_to do |format|
      if @user_resolution.save
        format.html { redirect_to user_resolution_url(@user_resolution), notice: "User resolution was successfully created." }
        format.json { render :show, status: :created, location: @user_resolution }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_resolutions/1 or /user_resolutions/1.json
  def update
    respond_to do |format|
      if @user_resolution.update(user_resolution_params)
        format.html { redirect_to user_resolution_url(@user_resolution), notice: "User resolution was successfully updated." }
        format.json { render :show, status: :ok, location: @user_resolution }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_resolutions/1 or /user_resolutions/1.json
  def destroy
    @user_resolution.destroy

    respond_to do |format|
      format.html { redirect_to user_resolutions_url, notice: "User resolution was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_resolution
      @user_resolution = UserResolution.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_resolution_params
      params.require(:user_resolution).permit(:user_id, :resolution_id)
    end
end
