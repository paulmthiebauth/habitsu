class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def index
  @user = current_user
  @scores = Dailyscore.where(user_id: @user.id)
  User.weekly_completion_data(@weekly_scores)
  @homepage_scores = PieManager.new(@user, @scores).home_scores

  respond_to do |format|
    format.html { render :index }
    format.json { render json: @homepage_scores.to_json}

  end

  end


  def update
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
    @habits = HabitManager.new(@user, @user.habits, @current_page).daily_habits

    @todays_score = ScoreManager.new(@user, @habits, @current_page).daily_scores
    @weekly_scores = ScoreManager.new(@user, @habits, @current_page).weekly_scores
    @user_score = User.weekly_completion_data(@weekly_scores)
    {:user_score => @user_score}.to_json
    @date = @current_page.days.ago.localtime

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @user_score.to_json}

    end
  end

end
