class StatsController < ApplicationController

  def index
    date = ((DateTime.now.beginning_of_day)..DateTime.now.end_of_day)
    @habits = Dailyhabit.where(user_id: current_user.id, date: date).sort_by{ |x| x.streak_count}.reverse
  end

end
