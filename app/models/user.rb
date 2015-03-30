class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tasks

  has_many :habits, through: :plan

  has_one :signup
  has_one :plan, through: :signup

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
