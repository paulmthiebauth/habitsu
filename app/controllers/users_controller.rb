class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @task = Task.new
    @tasks = Task.where(user_id: params[:id])
    @habits = @user.habits
  end



end
