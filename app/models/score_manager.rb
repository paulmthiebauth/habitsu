###Note : isolate potential issues with naming of methods


class ScoreManager
  def initialize(user, habits, num_days_ago)
    @user = user
    @habits = habits
    @num_days_ago = num_days_ago.to_i
  end

  def daily_scores
    @day_score = 0
    @date = calculate_date
    weekday = @date.strftime('%A')

    if no_score_for_today
      Dailyscore.create(
        user_id: @user.id, date: @date, weekday: weekday, total_score: 0
      )
    else
      calculate_day_score
      Dailyscore.where(
        user_id: @user.id, weekday: weekday
      ).where(
        date: (@date.beginning_of_day)..@date.end_of_day).first.update(
        total_score: @day_score
      )
    end
    check_todays_score(@date).first.total_score
  end


  def weekly_scores
    weekly_score_hash = {}
    count = 0
    date = count.days.ago.localtime
    weekday = date.localtime.strftime('%A')
    until count == 7
      weekday = date.localtime.strftime('%A')
      if check_todays_score_localtime(date).first.nil?
        Dailyscore.create(
          user_id: @user.id, date: count.days.ago.localtime,
          weekday: weekday, total_score: 0
        )
        weekly_score_hash[weekday] = 0
        count += 1
        date = count.days.ago.localtime
      else
        weekly_score_hash[weekday] = check_todays_score_localtime(date).first.total_score
        count += 1
        date = count.days.ago.localtime
      end
    end
    weekly_score_hash
  end

  def calculate_day_score
    @habits.each do |habit|
      @day_score += habit.point_value
    end
  end

  def calculate_date
    if @num_days_ago > 0
      date = @num_days_ago.days.ago.localtime
    else
      date = DateTime.now
    end
  end

  def create_daily_score

  end

  def no_score_for_today
    check_todays_score(@date).empty?
  end

  def check_todays_score(date)
    Dailyscore.where(user_id: @user.id
    ).where(
    date: (date.beginning_of_day)..date.end_of_day)
  end

  def check_todays_score_localtime(date)
    Dailyscore.where(user_id: @user.id
    ).where(
    date: (date.localtime.beginning_of_day)..date.localtime.end_of_day)
  end
end
