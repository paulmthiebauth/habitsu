class DailyhabitsController < ApplicationController

def update
  binding.pry
end


def complete
  user_id = current_user.id
  @habit = Dailyhabit.find(params[:dailyhabit_id])
  @habit.update_attribute(:completed_at, DateTime.now)
  redirect_to "/users/#{user_id}"
end

def incomplete
  user_id = current_user.id
  @task = Task.find(params[:id])
  @task.update_attribute(:completed_at, nil)
  @task.update_attribute(:completed, "False")
  redirect_to "/users/#{user_id}"
end

end
