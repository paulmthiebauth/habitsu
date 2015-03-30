class TasksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @task = @user.tasks
  end

  def new
    @user = User.find(params[:user_id])
    @task = Task.new
  end

  def show
  end

  def create
    user_id = params[:user_id]
    task_name = params["task"]["name"]
    completed = "False"
    task = Task.new(user_id: user_id, name: task_name, completed: completed)
    if task.save
      flash[:notice] = ['Task added.']
      redirect_to "/users/#{params[:user_id]}"
    else
      flash[:notice] = task.errors.full_messages
      redirect_to "/users/#{params[:user_id]}"
    end

  end
end
