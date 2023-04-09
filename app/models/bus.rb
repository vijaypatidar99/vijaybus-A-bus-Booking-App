class Bus < ApplicationRecord
    validates :name,:number, :company, :seats , presence: true
end
