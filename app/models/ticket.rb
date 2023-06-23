class Ticket < ApplicationRecord
    enum priority: { low: 1, medium_low: 2, medium: 3, medium_high: 4, high: 5 }
    enum status: { closed: 0, open: 1 }
    has_many :user_comments
    has_many :users, through: :user_comments


end
