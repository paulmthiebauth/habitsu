class TasksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @task = @user.tasks
  end

  def new
    @user = User.find(params[:user_id])
    @task = Task.new
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

  def complete
    user_id = current_user.id
    @task = Task.find(params[:id])
    @task.update_attribute(:completed_at, Time.now)
    @task.update_attribute(:completed, "True")
    redirect_to "/users/#{user_id}"
  end
end
