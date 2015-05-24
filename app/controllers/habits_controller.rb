class HabitsController < ApplicationController
  def new
    @habit = Habit.new
  end

  def create
    current_plan_id = params[:current_plan]
    new_habit_name = params[:habit][:name]
    new_habit = Habit.create(name: new_habit_name)
    Planhabit.create(plan_id: current_plan_id, habit_id: new_habit.id)
    redirect_to edit_plan_path(current_plan_id)
  end
end
