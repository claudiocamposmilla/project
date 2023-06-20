json.extract! ticket, :id, :claim_date, :due_date, :incident_date, :summary, :description, :priority, :status, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
