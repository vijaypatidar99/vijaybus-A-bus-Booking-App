class Bus < ApplicationRecord
  belongs_to :route
  has_many :tickets, dependent: :destroy
  self.per_page = 20
  default_scope -> { order(created_at: :desc) }
end
