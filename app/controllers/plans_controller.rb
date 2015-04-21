class PlansController < ApplicationController

  def index
    @user = current_user

    @plans = Plan.all
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
    Signup.where(user_id: params[:user_id], plan_id: params[:id]).first.destroy_all
    flash[:notice] = "You've successfully unenrolled."
    redirect to user_stats_path(user)
  end


end
