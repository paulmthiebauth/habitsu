class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def update
    binding.pry
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @users = current_user.id
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

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @user.to_json(methods: :completion_data) }
    end
  end

end
