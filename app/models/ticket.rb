class Ticket < ApplicationRecord
  belongs_to :bus
  belongs_to :user
  enum status: [:pending, :confirmed, :rejected]
end
