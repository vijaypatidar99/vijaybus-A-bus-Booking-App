class Route < ApplicationRecord
    validates :from,:to, :first_bus, :last_bus , presence: true
end
