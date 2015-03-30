class Plan < ActiveRecord::Base
  has_many :users, through: :signups
  has_many :signups
  has_many :habits, through: :planhabits
  has_many :planhabits
  validates :plan_name, presence: true
end
