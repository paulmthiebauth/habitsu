class StatsController < ApplicationController
  before_action :authenticate_user!

  def index
    date = ((DateTime.now.beginning_of_day)..DateTime.now.end_of_day)
    @habits = Dailyhabit.where(user_id: current_user.id, date: date).sort_by{ |x| x.streak_count}.reverse
    @plans = Signup.where(user_id: current_user.id)
    @user = current_user
  end

end
