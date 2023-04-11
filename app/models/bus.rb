class Bus < ApplicationRecord
  belongs_to :route
  self.per_page = 6
end
