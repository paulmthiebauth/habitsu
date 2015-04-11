class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @plans = @user.plans
    @task = Task.new
    @tasks = Task.where(user_id: params[:id])
    @date = @user.current
  end

  def yesterday
    # params["day"] = "Yesterday"
    # redirect_to user_path(params[:id])
  end

  def edit
  end

  def destroy
  end


end
