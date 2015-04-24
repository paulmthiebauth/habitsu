class HabitsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @habit = @user.habits
  end

  def new
    @user = User.find(params[:user_id])
    @habit = Habit.new
  end

  def create
    user_id = params[:user_id]
    task_name = params["task"]["name"]
    completed = "False"
    habit = Task.new(user_id: user_id, name: task_name, completed: completed)
  end
end
