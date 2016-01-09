class PointsManager
  def initialize(current_user, habit)
    @user = current_user
    @habit = habit
  end

  def add_points
    habit_count = Dailyhabit.where(
      user_id: @user.id).where(
      'date >= ?', DateTime.now.beginning_of_day..DateTime.now.end_of_day).count
    daily_point_value = (100.0 / habit_count.to_f)
    @habit.update_attribute(:completed_at, DateTime.now)
    @habit.update_attribute(:point_value, daily_point_value)
  end

  def remove_points
    @habit.update_attribute(:completed_at, nil)
    @habit.update_attribute(:point_value, 0)
  end
end
