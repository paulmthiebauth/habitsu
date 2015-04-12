class Dailyhabit < ActiveRecord::Base
  belongs_to :user
  belongs_to :habit
  validates :habit_id, presence: true
  validates :user_id, presence: true

  validates :user_id, uniqueness: {
  scope: :date, message: "User can only vote once per review."
}
end
