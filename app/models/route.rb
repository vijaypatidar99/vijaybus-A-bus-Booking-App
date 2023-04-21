class Route < ApplicationRecord
  has_many :schedules
  has_many :buses, :through => :schedules ,dependent: :destroy
  validates :from, :to, presence: true
  validate :start_and_end_points_are_unique
  self.per_page = 12
  default_scope -> { order(created_at: :desc) }

  def display_name
    "#{from} -  #{to}"
  end

  private

  def start_and_end_points_are_unique
    if from == to
      errors.add(:to, "can't be the same as the start point")
    elsif Route.exists?(from: from, to: to)
      errors.add(:to, "route already exists ")
    end
  end
end
