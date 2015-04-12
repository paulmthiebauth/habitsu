class HabitManager
  def initialize(user, habits, num_days_ago)
    @user = user
    @habits = habits
    @num_days_ago = num_days_ago.to_i
  end

  def daily_habits
    if @num_days_ago > 0
    date = @num_days_ago.days.ago
    daily = @user.dailyhabits.where(date: (date.beginning_of_day..date.end_of_day))
    else
    @habits.each do |habit|
      if Dailyhabit.where(user_id: @user.id, habit_id: habit.id).where("date >= ?", Time.zone.now.beginning_of_day).empty?
        binding.pry
        plan = Planhabit.where(habit_id: habit.id)
        Dailyhabit.create(user_id: @user.id, habit_id: habit.id, plan_id: plan.first.plan_id, point_value: 0 , completed_at: nil, date: DateTime.now)
      end
      daily = Dailyhabit.where(user_id: @user.id, date: Time.zone.now.beginning_of_day)
      end
    end
    daily
  end
end
