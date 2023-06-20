class Resolution < ApplicationRecord
  belongs_to :ticket
  after_save :update_ticket_status, if: :saved_change_to_resolved?

  enum resolved: { closed: 0, open: 1 }

  has_many :user_resolutions
  has_many :users, through: :user_resolutions


  def update_ticket_status
    if resolved == "closed"
      ticket.update(status: 0)
    elsif resolved == "open"
      ticket.update(status: 1)
    end
  end


end
