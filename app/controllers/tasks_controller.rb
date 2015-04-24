class TasksController < ApplicationController
  before_action :authenticate_user!

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

  def destroy
    user_id = params[:user_id]
    Task.find(params[:id]).destroy
    flash[:notice] = ['Task deleted.']
    redirect_to "/users/#{user_id}"
  end


  def complete
    user_id = current_user.id
    @task = Task.find(params[:id])
    @task.update_attribute(:completed_at, DateTime.now)
    @task.update_attribute(:completed, "True")
    flash[:notice] = ['Task complete.']
    redirect_to "/users/#{user_id}"
  end

  def incomplete
    user_id = current_user.id
    @task = Task.find(params[:id])
    @task.update_attribute(:completed_at, nil)
    @task.update_attribute(:completed, "False")
    flash[:notice] = ['Task updated.']
    redirect_to "/users/#{user_id}"
  end
end
