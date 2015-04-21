class TaskManager
  def initialize(user, num_days_ago)
    @user = user
    @num_days_ago = num_days_ago.to_i
  end

  def organized_tasks
    if @num_days_ago > 0
      date = @num_days_ago.days.ago.localtime
      @user.tasks.where(created_at: (date.beginning_of_day..date.end_of_day))
    else
      @user.tasks.where("created_at >= ?", DateTime.now.beginning_of_day)
    end
  end

  def update_tasks
    tasks_needing_rollover = @user.tasks.where(completed: "False")
    tasks_needing_rollover.each do |task_update|
      task_update.update(created_at: DateTime.now)
    end
  end


end
