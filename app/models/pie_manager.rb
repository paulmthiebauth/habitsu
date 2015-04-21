class PieManager
  def initialize(user, scores)
    @user = user
    @scores = scores
  end

  def home_scores
    home_scores_hash = {}

    if Dailyscore.where(user_id: @user.id).where(date: (1.days.ago.localtime.beginning_of_day)..1.days.ago.localtime.end_of_day).first.nil?
      home_scores_hash["Yesterday-Complete"] = 0
      home_scores_hash["Yesterday-Incomplete"] = 100
    else
      home_scores_hash["Yesterday-Complete"] = Dailyscore.where(user_id: @user.id).where(date: (1.days.ago.localtime.beginning_of_day)..1.days.ago.localtime.end_of_day).first.total_score
      home_scores_hash["Yesterday-Incomplete"] = (100 - home_scores_hash["Yesterday-Complete"])
    end

    if Dailyscore.where(user_id: @user.id).where(date: (0.days.ago.localtime.beginning_of_day)..0.days.ago.localtime.end_of_day).first.nil?
      home_scores_hash["Today-Complete"] = 0
      home_scores_hash["Today-Incomplete"] = 100
    else
      home_scores_hash["Today-Complete"] = Dailyscore.where(user_id: @user.id).where(date: (0.days.ago.localtime.beginning_of_day)..0.days.ago.localtime.end_of_day).first.total_score
      home_scores_hash["Today-Incomplete"] = (100 - home_scores_hash["Today-Complete"])
    end

    five_day_total = 0
    count = 0
    5.times do
      if Dailyscore.where(user_id: @user.id).where(date: (count.days.ago.localtime.beginning_of_day)..count.days.ago.localtime.end_of_day).first.nil?
        five_day_total += 0
        count += 1
      else
        score = Dailyscore.where(user_id: @user.id).where(date: (count.days.ago.localtime.beginning_of_day)..count.days.ago.localtime.end_of_day).first.total_score
        five_day_total += score
        count += 1
      end
    end
    average = (five_day_total / 5)
    home_scores_hash["Five-Day-Complete"] = average
    home_scores_hash["Five-Day-Incomplete"] = (100 - average)

    home_scores_hash
  end

end
