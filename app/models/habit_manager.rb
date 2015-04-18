class HabitManager
  def initialize(user, habits, num_days_ago)
    @user = user
    @habits = habits
    @num_days_ago = num_days_ago.to_i
  end

  def daily_habits
    if @num_days_ago > 0
      date = @num_days_ago.days.ago.localtime
      x = 1
      @habits.each do |habit|
        if Dailyhabit.where(user_id: @user.id, habit_id: habit.id).where(date: (date.beginning_of_day)..date.end_of_day).empty?
          plan = Planhabit.where(habit_id: habit.id)
          Dailyhabit.create(user_id: @user.id, habit_id: habit.id, plan_id: plan.first.plan_id, point_value: 0 , completed_at: nil, date: date + x.second)
          x += 1
        else
          Dailyhabit.where(user_id: @user.id, habit_id: habit.id).where(date: (date.beginning_of_day)..date.end_of_day).first.update(streak_count: 0)
        end
      end
      daily = Dailyhabit.where(user_id: @user.id, date: (date.beginning_of_day)..date.end_of_day)
    else
      date = DateTime.now
      daily = @user.dailyhabits.where(date: (date.beginning_of_day..date.end_of_day))
      @habits.each do |habit|
        if Dailyhabit.where(user_id: @user.id, habit_id: habit.id).where("date >= ?", DateTime.now.beginning_of_day).empty?
          plan = Planhabit.where(habit_id: habit.id)
          Dailyhabit.create(user_id: @user.id, habit_id: habit.id, plan_id: plan.first.plan_id, point_value: 0 , completed_at: nil, date: DateTime.now)
        else
          Dailyhabit.where(user_id: @user.id, habit_id: habit.id).where(date: (date.beginning_of_day)..date.end_of_day).first.update(streak_count: 0)
          count = 0
          date_counter = @num_days_ago.days.ago.localtime - count.day
          until Dailyhabit.where(user_id: @user.id, habit_id: habit.id).where(date: (date_counter.beginning_of_day)..date_counter.end_of_day).empty?
            if !Dailyhabit.where(user_id: @user.id, habit_id: habit.id).where(date: (date_counter.beginning_of_day)..date_counter.end_of_day).first.completed_at.nil?
              streak = Dailyhabit.where(user_id: @user.id, habit_id: habit.id).where(date: (DateTime.now.beginning_of_day)..DateTime.now.end_of_day).first
              current_streak = streak.streak_count
              streak.update(streak_count: current_streak + 1)
            end
            count += 1
            date_counter = @num_days_ago.days.ago.localtime - count.day
          end
          daily = Dailyhabit.where(user_id: @user.id, date: (date.beginning_of_day)..date.end_of_day)
        end
      end
    end
    daily
  end
end
