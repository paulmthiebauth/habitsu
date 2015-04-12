class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @plans = @user.plans
    @task = Task.new
      if params[:q].nil?
        @current_page = 0
      else
      @current_page = params[:q].to_i
      end
    @tasks = TaskManager.new(@user, @current_page).organized_tasks
    habits = HabitManager.new(@user, @user.habits, @current_page).daily_habits
    @habits = @user.dailyhabits
  end

end
