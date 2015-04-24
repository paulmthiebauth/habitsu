class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  def index
    if signed_in?
      @user = current_user
      @scores = Dailyscore.where(user_id: @user.id)
      User.weekly_completion_data(@weekly_scores)
      @homepage_scores = PieManager.new(@user, @scores).home_scores
      respond_to do |format|
        format.html { render :index }
        format.json { render json: @homepage_scores.to_json}
      end
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @user = User.new
  end

  def show
    start_time = Time.now
    @user = User.find(current_user.id)
    @plans = @user.plans
    @task = Task.new
    if params[:q].nil?
      @current_page = 0
    else
      @current_page = params[:q].to_i
    end

    TaskManager.new(@user, @current_page).update_tasks
    @tasks = TaskManager.new(@user, @current_page).organized_tasks

    @habits = HabitManager.new(@user, @user.habits, @current_page).daily_habits

    @todays_score = ScoreManager.new(@user, @habits, @current_page).daily_scores
    @weekly_scores = ScoreManager.new(@user, @habits, @current_page).weekly_scores
    @date = @current_page.days.ago.localtime

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @weekly_scores.to_json}
    end
    puts (Time.now - start_time) * 1000
  end
end
