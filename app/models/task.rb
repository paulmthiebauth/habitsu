class Task < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :name, presence: true
end
