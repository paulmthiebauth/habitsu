class ScoreManager
  def initialize(user, habits, num_days_ago)
    @user = user
    @habits = habits
    @num_days_ago = num_days_ago.to_i
  end

  def daily_scores
    day_score = 0
    date = @num_days_ago.days.ago
    weekday = DateTime.now.strftime('%A')
    #########SET AND CALCULATE TODAYS SCORE
    if Dailyscore.where(user_id: @user.id).where(date: (date.beginning_of_day)..date.end_of_day).empty?
      Dailyscore.create(user_id: @user.id, date: DateTime.now, weekday: weekday, total_score: 0)
    else
      @habits.each do |habit|
        day_score += habit.point_value
      end
      Dailyscore.where(user_id: @user.id, weekday: weekday).where(date: (date.beginning_of_day)..date.end_of_day).first.update(total_score: day_score)
    end
    Dailyscore.where(user_id: @user.id).where(date: (date.beginning_of_day)..date.end_of_day).first.total_score
  end

  def weekly_scores
    weekly_score_hash = {}
    date = 0.days.ago
    if DateTime.now.strftime('%A') == "Monday"
      weekly_score_hash["Monday"] = Dailyscore.where(user_id: @user.id).where(date: (date.beginning_of_day)..date.end_of_day).first.total_score
    else
      count = 0
      date = count.days.ago
      until Dailyscore.where(user_id: @user.id).where(date: (date.beginning_of_day)..date.end_of_day).first.nil? || Dailyscore.where(user_id: @user.id).where(date: (date.beginning_of_day)..date.end_of_day).first.weekday == "Sunday"
        day = Dailyscore.where(user_id: @user.id).where(date: (date.beginning_of_day)..date.end_of_day).first.weekday
        weekly_score_hash[day] = Dailyscore.where(user_id: @user.id).where(date: (date.beginning_of_day)..date.end_of_day).first.total_score
        count += 1
        date = count.days.ago
      end
    end
    weekly_score_hash
  end

end
