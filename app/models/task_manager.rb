class TaskManager
  def initialize(user, num_days_ago)
    @user = user
    @num_days_ago = num_days_ago.to_i
  end

  def organized_tasks
    if @num_days_ago > 0
      date = @num_days_ago.days.ago
      @user.tasks.where(created_at: (date.beginning_of_day..date.end_of_day))
    else
      @user.tasks.where("created_at >= ?", Time.zone.now.beginning_of_day)
    end
  end
end