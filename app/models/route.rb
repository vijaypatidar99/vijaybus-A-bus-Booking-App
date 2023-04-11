class Route < ApplicationRecord
    has_many :buses, dependent: :destroy
    validates :from, :to, :first_bus, :last_bus, presence: true
    self.per_page = 12
    default_scope -> { order(created_at: :desc) }
end
