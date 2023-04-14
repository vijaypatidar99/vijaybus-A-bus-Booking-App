class Ticket < ApplicationRecord
  belongs_to :bus
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  enum status: [:Pending, :Confirmed, :Rejected, :Cancelled]
  # validates :name, presence: true, length: { minimum: 2 }
  # validates :age, :sex,  presence: true, numericality: { only_integer: true, greater_than: 0 }
  # validates :user_id, presence: true
end
