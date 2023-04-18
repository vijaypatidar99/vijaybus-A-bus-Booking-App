class Schedule < ApplicationRecord
    belongs_to :bus
    accepts_nested_attributes_for :bus
end
