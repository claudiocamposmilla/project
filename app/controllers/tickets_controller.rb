class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1 or /tickets/1.json
  def show
    @user = current_user
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @ticket.claim_date = Date.today

  end

  # GET /tickets/1/edit
  def edit

  end

  # POST /tickets or /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        assign_executive_and_creator_to_ticket(@ticket)

        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    @resolution = Resolution.find(params[:id])

    respond_to do |format|
      if @resolution.update(resolution_params)
        format.html { redirect_to @resolution, notice: "Resolution was successfully updated." }
        format.json { render :show, status: :ok, location: @resolution }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resolution.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:claim_date, :due_date, :incident_date, :summary, :description, :priority, :status)
    end

    def assign_executive_and_creator_to_ticket(ticket)
      # Encuentra un ejecutivo que tenga la menor cantidad de tickets asignados
      executive = User.where(profile: 'executive').left_joins(:user_comments)
                              .group(:id)
                              .order('COUNT(user_comments.id) ASC')
                              .first

      if executive
        # Crea un UserComment para el ejecutivo asignado
        UserComment.create(user_id: executive.id, ticket_id: ticket.id)
      end

      # Crea un UserComment para el usuario que creó el ticket
      UserComment.create(user_id: current_user.id, ticket_id: ticket.id)

      # Crear una Resolution asociada al ticket
      resolution = Resolution.create(ticket_id: ticket.id, resolution_comment: 'Ejecutivo acusa recibo - se está solucionando su problema')

      # Crea UserResolution para el ejecutivo
      UserResolution.create(user_id: executive.id, resolution_id: resolution.id)

      # Crea UserResolution para el usuario que creó el ticket
      UserResolution.create(user_id: current_user.id, resolution_id: resolution.id)
    end



end
