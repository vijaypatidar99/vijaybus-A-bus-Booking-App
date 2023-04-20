class Schedule < ApplicationRecord
  belongs_to :bus
  belongs_to :route

  self.per_page = 20
end
