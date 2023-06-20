class UserCommentsController < ApplicationController
  before_action :set_user_comment, only: %i[ show edit update destroy ]

  # GET /user_comments or /user_comments.json
  def index
    @user_comments = UserComment.all
  end

  # GET /user_comments/1 or /user_comments/1.json
  def show
  end

  # GET /user_comments/new
  def new
    @user_comment = UserComment.new
  end

  # GET /user_comments/1/edit
  def edit
  end

  # POST /user_comments or /user_comments.json
  def create
    @user_comment = UserComment.new(user_comment_params)

    respond_to do |format|
      if @user_comment.save
        format.html { redirect_to user_comment_url(@user_comment), notice: "User comment was successfully created." }
        format.json { render :show, status: :created, location: @user_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_comments/1 or /user_comments/1.json
  def update
    respond_to do |format|
      if @user_comment.update(user_comment_params)
        format.html { redirect_to user_comment_url(@user_comment), notice: "User comment was successfully updated." }
        format.json { render :show, status: :ok, location: @user_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_comments/1 or /user_comments/1.json
  def destroy
    @user_comment.destroy

    respond_to do |format|
      format.html { redirect_to user_comments_url, notice: "User comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_comment
      @user_comment = UserComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_comment_params
      params.require(:user_comment).permit(:user_id, :ticket_id, :body)
    end
end
