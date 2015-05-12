class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tasks

  has_many :habits, through: :plans
  has_many :plans, through: :signups

  has_many :signups
  has_many :dailyhabits

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  ###Note : address this method

  def self.weekly_completion_data(scores)
    scores
  end
end
