class Bus < ApplicationRecord
  validates :name, :number, presence: true, uniqueness: true
  has_many :schedules
  has_many :route, through: :schedules
  has_many :tickets, dependent: :destroy

  self.per_page = 10

  default_scope -> { order(created_at: :desc) }

  def display_name
    "#{name}-#{number} "
  end
end
