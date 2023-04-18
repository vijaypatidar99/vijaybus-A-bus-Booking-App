class Schedule < ApplicationRecord
    belongs_to :bus
    belongs_to :route
end
