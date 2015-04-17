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

  def current
    if @todays_date.nil?
      @todays_date = DateTime.now
    end
    @todays_date
  end

  def today
    @todays_date = DateTime.now
  end

  def yesterday
    @todays_date = @todays_date.yesterday
  end

  def tomorrow
    @todays_date = @todays_date.tomorrow
  end

  def self.weekly_completion_data(scores)
    scores
  end

end
