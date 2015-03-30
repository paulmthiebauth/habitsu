class HabitsController < ApplicationController
  @habit_list_basic = [
    "Wake up early",
    "Make bed",
    "Eat breakfast",
    "Motivational Mantra",
    "Update To Do List"
  ]

  @habit_list_overhaul = [
  ]

  def index
    @user = User.find(params[:user_id])
    @habit = @user.habits
  end

  def new
    @user = User.find(params[:user_id])
    @habit = Habit.new
  end

  def show
  end

  def create
    user_id = params[:user_id]
    task_name = params["task"]["name"]
    completed = "False"
    habit = Task.new(user_id: user_id, name: task_name, completed: completed)
  end
end
