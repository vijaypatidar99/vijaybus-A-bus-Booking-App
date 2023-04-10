class Bus < ApplicationRecord
  belongs_to :route
  self.per_page = 4
end
