class PieManager
  def initialize(user, scores)
    @user = user
    @scores = scores
  end

  def home_scores
    home_scores_hash = {}

    if days_ago_score(1).first.nil?
      home_scores_hash["Yesterday-Complete"] = 0
      home_scores_hash["Yesterday-Incomplete"] = 100
    else
      home_scores_hash["Yesterday-Complete"] = (
      days_ago_score(1).first.total_score
      )
      home_scores_hash["Yesterday-Incomplete"] = (
      100 - home_scores_hash["Yesterday-Complete"]
      )
    end

    if days_ago_score(0).first.nil?
      home_scores_hash["Today-Complete"] = 0
      home_scores_hash["Today-Incomplete"] = 100
    else
      home_scores_hash["Today-Complete"] = days_ago_score(0).first.total_score
      home_scores_hash["Today-Incomplete"] = (
      100 - home_scores_hash["Today-Complete"]
      )
    end

    five_day_total = 0
    count = 0
    5.times do
      if user_todays_date_range(count).first.nil?
        five_day_total += 0
        count += 1
      else
        score = user_todays_date_range(count).first.total_score
        five_day_total += score
        count += 1
      end
    end
    average = (five_day_total / 5)
    home_scores_hash["Five-Day-Complete"] = average
    home_scores_hash["Five-Day-Incomplete"] = (100 - average)

    home_scores_hash
  end

  def user_dailyscore
    Dailyscore.where(user_id: @user.id)
  end

  def user_todays_date_range(count)
    user_dailyscore.where(
    date: (
    count.days.ago.localtime.beginning_of_day
    )..count.days.ago.localtime.end_of_day
    )
  end

  def days_ago_score(count)
    user_dailyscore.where(date: (
    count.days.ago.localtime.beginning_of_day
    )..count.days.ago.localtime.end_of_day
    )
  end
end
