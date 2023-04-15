class Bus < ApplicationRecord
  belongs_to :route
  has_many :tickets, dependent: :destroy
  self.per_page = 12
  default_scope -> { order(created_at: :desc) }
  validates :name, :number, presence: true, uniqueness: true
  validates :seats, :pickup, :drop, :departure_time, :arrival_time, :starting_city, :destination_city, :price, :dates, presence: true
end
