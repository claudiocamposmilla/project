class ReportsController < ApplicationController
  before_action :ensure_admin_or_supervisor

  def index

  end


  def tickets_by_dates
    start_date = params[:start_date].to_date
    end_date = params[:end_date].to_date
  
    total_tickets = Ticket.where(claim_date: start_date..end_date).count
    open_tickets = Ticket.where(claim_date: start_date..end_date, status: :open).count
    closed_tickets = Ticket.where(claim_date: start_date..end_date, status: :closed).count
    labels = Ticket.where(claim_date: start_date..end_date).pluck(:tags).flatten
  
    render json: {
      total_tickets: total_tickets,
      open_tickets: open_tickets,
      closed_tickets: closed_tickets,
      labels: labels
    }
  end
  
  



  private





  def ensure_admin_or_supervisor
    unless current_user.administrator? || current_user.supervisor?
      redirect_to root_path, alert: 'No estás autorizado para ver esta página.'
    end
  end
end
