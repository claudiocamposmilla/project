class UserTicketsController < ApplicationController
  before_action :set_user_ticket, only: %i[ show edit update destroy ]

  # GET /user_tickets or /user_tickets.json
  def index
    @user_tickets = UserTicket.all
  end

  # GET /user_tickets/1 or /user_tickets/1.json
  def show
  end

  # GET /user_tickets/new
  def new
    @user_ticket = UserTicket.new
  end

  # GET /user_tickets/1/edit
  def edit
  end

  # POST /user_tickets or /user_tickets.json
  def create
    @user_ticket = UserTicket.new(user_ticket_params)
    @ticket.user = current_user
    respond_to do |format|
      if @user_ticket.save
        format.html { redirect_to user_ticket_url(@user_ticket), notice: "User ticket was successfully created." }
        format.json { render :show, status: :created, location: @user_ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_tickets/1 or /user_tickets/1.json
  def update
    respond_to do |format|
      if @user_ticket.update(user_ticket_params)
        format.html { redirect_to user_ticket_url(@user_ticket), notice: "User ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @user_ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_tickets/1 or /user_tickets/1.json
  def destroy
    @user_ticket.destroy

    respond_to do |format|
      format.html { redirect_to user_tickets_url, notice: "User ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_ticket
      @user_ticket = UserTicket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_ticket_params
      params.require(:user_ticket).permit(:user_id, :ticket_id)
    end
end
