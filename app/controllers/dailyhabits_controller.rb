class DailyhabitsController < ApplicationController
  respond_to :html, :json
  def update
    habit = current_user.dailyhabits.find(params[:id])
    if habit.completed_at.nil?
    habit.update_attribute(:completed_at, DateTime.now)
     respond_to do |format|
       if habit.save
       format.html { redirect_to user_path(current_user), notice: "Habit complete!" }
       format.json { render json: habit }
       end
     end
   elsif !habit.completed_at.nil?
     habit = current_user.dailyhabits.find(params[:id])
     habit.update_attribute(:completed_at, nil)
     respond_to do |format|
       if habit.save
       format.html { redirect_to user_path(current_user), notice: "Habit updated!" }
       format.json { render json: habit }
       end
     end
    end
  end
end
