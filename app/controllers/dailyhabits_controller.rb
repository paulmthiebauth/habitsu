class DailyhabitsController < ApplicationController
  respond_to :html, :json
  def update
    habit = current_user.dailyhabits.find(params[:id])
    if habit.completed_at.nil?
    score = habit.streak_count
    habit.update_attribute(:completed_at, DateTime.now)
    habit.update_attribute(:streak_count, score + 1)
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
