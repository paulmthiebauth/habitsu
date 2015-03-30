class Habit < ActiveRecord::Base
  has_many :plans, through: :planhabits
  has_many :planhabits

  has_many :users, through: :plan
  has_many :plans

  validates :name, presence: true
  validates :completed, presence: true
  validates :point_value, presence: true
end
