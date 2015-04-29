class DailyhabitsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :json
  def update
    habit = current_user.dailyhabits.find(params[:id])
    if habit.completed_at.nil?
      PointsManager.new(current_user, habit).add_points
      respond_to do |format|
        if habit.save
          format.html do
            redirect_to user_path(current_user), notice: "Habit complete!"
          end
          format.json { render json: habit }
        end
      end
    elsif !habit.completed_at.nil?
      PointsManager.new(current_user, habit).remove_points
      respond_to do |format|
        if habit.save
          format.html do
            redirect_to user_path(current_user), notice: "Habit updated!"
          end
          format.json { render json: habit }
        end
      end
    end
  end
end
