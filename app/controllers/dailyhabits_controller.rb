class DailyhabitsController < ApplicationController

  before_action :authenticate_user!
  respond_to :html, :json
  def update
    habit = current_user.dailyhabits.find(params[:id])
    if habit.completed_at.nil?
      score = habit.streak_count
      habit_count = Dailyhabit.where(user_id: current_user.id).where('date >= ?', DateTime.now.beginning_of_day..DateTime.now.end_of_day).count
      daily_point_value = ( 100.0 / habit_count.to_f )
      habit.update_attribute(:completed_at, DateTime.now)
      habit.update_attribute(:streak_count, score + 1)
      habit.update_attribute(:point_value, daily_point_value )
      respond_to do |format|
        if habit.save
          format.html { redirect_to user_path(current_user), notice: "Habit complete!" }
          format.json { render json: habit }
        end
      end
    elsif !habit.completed_at.nil?
      habit = current_user.dailyhabits.find(params[:id])
      score = habit.streak_count
      habit.update_attribute(:completed_at, nil)
      habit.update_attribute(:point_value, 0 )
      if habit.streak_count > 0
        habit.update_attribute(:streak_count, score - 1)
      end
      respond_to do |format|
        if habit.save
          format.html { redirect_to user_path(current_user), notice: "Habit updated!" }
          format.json { render json: habit }
        end
      end
    end
  end
end
