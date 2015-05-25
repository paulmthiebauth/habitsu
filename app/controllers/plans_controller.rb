class PlansController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @plans = Plan.where(id: 1..4)
  end

  def update
    if Signup.where(user_id: params[:user_id], plan_id: params[:id]).empty?
      Signup.create(user_id: params[:user_id], plan_id: params[:id])
      flash[:notice] = "Signup Successful!"
      redirect_to user_path(params[:user_id])
    else
      flash[:notice] = "You're already signed up for that program."
      redirect_to plans_path
    end
  end

  def destroy
    user = User.find(params[:user_id])
    Signup.where(user_id: params[:user_id], plan_id: params[:id]).first.destroy
    Dailyhabit.where(user_id: params[:user_id], plan_id: params[:id]).destroy_all
    flash[:notice] = "You've successfully unenrolled."
    redirect_to user_stats_path(user)
  end

  def new
    @plan = Plan.new
    @habit = Habit.new
  end

  def create
    name = params[:plan][:plan_name]
    author_name = params[:plan][:author]
    bio = params[:plan][:author_info]
    new_plan = Plan.create(plan_name: name, author: author_name, author_info: bio, author_id: current_user.id)
    redirect_to edit_plan_path(new_plan)
  end

  def edit
    current_plan_author = Plan.find(params[:id]).author_id
    if current_plan_author == current_user.id
    @new_habit = Habit.new
    @plan = Plan.find(params[:id])
      if !Planhabit.where(plan_id: @plan.id).empty?
        @habits = Planhabit.where(plan_id: @plan)
      else
        @habits = []
      end
    else
      redirect_to user_path(current_user)
      flash[:notice] = ["You must be the author of a plan to edit its features."]
    end
  end

end
