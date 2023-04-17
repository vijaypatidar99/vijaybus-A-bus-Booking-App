class Bus < ApplicationRecord
  belongs_to :route
 # has_many :schedules
 # accepts_nested_attributes_for :schedules
  has_many :tickets, dependent: :destroy
  self.per_page = 12
  default_scope -> { order(created_at: :desc) }
  validates :name, :number, presence: true, uniqueness: true
  #validates :seats, :pickup, :drop, :departure_time, :arrival_time, :price, :dates, presence: true
end
