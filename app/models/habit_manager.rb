class HabitManager
  def initialize(user, habits, num_days_ago)
    @user = user
    @habits = habits
    @num_days_ago = num_days_ago.to_i
  end

  def daily_habits
    if @num_days_ago > 0
      date = @num_days_ago.days.ago.localtime
      second_counter = 1
      @habits.each do |habit|
        if days_habits(date, habit).empty?
          plan = Planhabit.where(habit_id: habit.id)

          Dailyhabit.create(
            user_id: @user.id,
            habit_id: habit.id,
            plan_id: plan.first.plan_id,
            point_value: 0,
            completed_at: nil,
            date: date + second_counter.second
          )

          second_counter += 1
        else
          days_habits(date, habit).first.update(streak_count: 0)
        end
      end
      daily = Dailyhabit.where(
      user_id: @user.id,
      date: todays_date_range(date)
      )

    else
      date = DateTime.now
      daily = @user.dailyhabits.where(
      date: (date.beginning_of_day..date.end_of_day))
      @habits.each do |habit|
        if Dailyhabit.where(
          user_id: @user.id,
          habit_id: habit.id
          ).where(
          "date >= ?", DateTime.now.beginning_of_day
          ).empty?

          plan = Planhabit.where(habit_id: habit.id)

          Dailyhabit.create(
            user_id: @user.id,
            habit_id: habit.id,
            plan_id: plan.first.plan_id,
            point_value: 0,
            completed_at: nil,
            date: DateTime.now
          )

          daily = Dailyhabit.where(
            user_id: @user.id,
            date: todays_date_range(date)
          )
        end
      end
    end
    daily
  end

  def streak_counter
    @habits.each do |habit|
      count = 0
      date = @num_days_ago.days.ago.localtime - count.day
      days_habits(date, habit).first.update(streak_count: 0)
        while !days_habits(date, habit).empty? && !days_habits(date, habit).first.completed_at.nil?
            streak = Dailyhabit.where(
            user_id: @user.id,
            habit_id: habit.id
            ).where(date: (
            DateTime.now.beginning_of_day)..DateTime.now.end_of_day
            ).first

            current_streak = streak.streak_count
            streak.update(streak_count: current_streak + 1)

            count += 1
            date = @num_days_ago.days.ago.localtime - count.day
        end
    end
  end

  def days_habits(date, habit)
    Dailyhabit.where(
    user_id: @user.id,
    habit_id: habit.id
    ).where(
    date: todays_date_range(date)
    )
  end

  def todays_date_range(date)
    (date.beginning_of_day)..date.end_of_day
  end

end
