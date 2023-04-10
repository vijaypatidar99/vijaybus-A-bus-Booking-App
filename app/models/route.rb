class Route < ApplicationRecord
    has_many :buses
    validates :from, :to, :first_bus, :last_bus, presence: true
    self.per_page = 6
end
