class UsersController < ApplicationController
  #before_action :set_user, only: %i[ show edit update destroy ]
  load_and_authorize_resource
  # GET /users or /users.json
  def index
    @users = User.all
  end

  def my_comments
    @user = User.find(params[:id])
    @tickets = case params[:filter]
               when 'priority'
                 @user.tickets.order(priority: :desc).uniq
               else
                 @user.tickets.uniq
               end
  
    respond_to do |format|
      format.html
      format.json { render json: @tickets }
    end
  end
  
  

  def my_replies
    if current_user.administrator? || current_user.supervisor? || current_user.executive?
      # Si el usuario es un administrador, supervisor o ejecutivo, obtenemos todos los comentarios de todos los usuarios
      @user_comments_grouped_by_ticket = UserComment.includes(:ticket, :user).group_by(&:ticket_id)
    else
      # Si no, solo obtenemos los comentarios del usuario actual
      @user = User.find(params[:id])
      @user_comments_grouped_by_ticket = @user.user_comments.includes(:ticket).group_by(&:ticket_id)
    end
  end

  def my_resolutions
    @user = User.find(params[:id])
    @resolutions = @user.resolutions.uniq
  end


  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find(params[:id])

    if params[:user][:profile] == "administrator"
      flash[:alert] = "No puedes asignar el perfil de administrador."
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
      return
    end

    if params[:user][:profile] == "supervisor"
      flash[:alert] = "No puedes asignar el perfil de supervisor."
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
      return
    end


    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

    respond_to do |format|
      if @user.update(user_params)
        if @user.role_changed?
          if @user.role_was == "adminstrator" && @user.role == "supervisor"
            administrator = User.where(role: :admin).min_by { |user| user.supervisors_count }
            @user.update(administrator: administrator)

          elsif @user.role_was == "adminstrator" && @user.role == "executive"
            supervisor = User.where(role: :supervisor).min_by { |user| user.executives_count }
            administrator = supervisor.administrator if supervisor.present?
            @user.update(supervisor: supervisor, administrator: administrator)

          elsif @user.role_was == "adminstrator" && @user.role == "normal"
            @user.update(supervisor: nil, administrator: nil, executive: nil)

          elsif @user.role_was == "supervisor" && @user.role == "administrator"
            @user.update(supervisor: nil, administrator: nil, executive: nil)

          elsif @user.role_was == "supervisor" && @user.role == "executive"
            supervisor = User.where(role: :supervisor).min_by { |user| user.executives_count }
            administrator = supervisor.administrator if supervisor.present?
            @user.update(supervisor: supervisor, administrator: administrator)

          elsif @user.role_was == "supervisor" && @user.role == "normal"
            @user.update(supervisor: nil, administrator: nil, executive: nil)

          elsif @user.role_was == "executive" && @user.role == "administrator"
            @user.update(supervisor: nil, administrator: nil, executive: nil)

          elsif @user.role_was == "executive" && @user.role == "supervisor"
            administrator = User.where(role: :admin).min_by { |user| user.supervisors_count }
            @user.update(administrator: administrator)

          elsif @user.role_was == "executive" && @user.role == "normal"
            @user.update(supervisor: nil, administrator: nil, executive: nil)







          if @user.role_was == "executive" && @user.role == "supervisor"
            administrator = User.where(role: :admin).min_by { |user| user.supervisors_count }
            @user.update(administrator: administrator)
          elsif @user.role_was == "supervisor" && @user.role == "executive"
            supervisor = User.where(role: :supervisor).min_by { |user| user.executives_count }
            administrator = supervisor.administrator if supervisor.present?
            @user.update(supervisor: supervisor, administrator: administrator)
          end
        end

        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end












  end


  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :lastname, :profile)
    end
    
  end
end
