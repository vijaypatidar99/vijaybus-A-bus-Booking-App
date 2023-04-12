class Ticket < ApplicationRecord
  belongs_to :bus
  belongs_to :user
  
end
