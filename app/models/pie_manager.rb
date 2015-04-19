class PieManager
  def initialize(user, scores)
    @user = user
    @scores = scores
  end

  def home_scores
    home_scores_hash = {}
    home_scores_hash["Yesterday-Complete"] = Dailyscore.where(user_id: @user.id).where(date: (1.days.ago.localtime.beginning_of_day)..1.days.ago.localtime.end_of_day).first.total_score
    home_scores_hash["Yesterday-Incomplete"] = (100 - home_scores_hash["Yesterday-Complete"])

    home_scores_hash["Today-Complete"] = Dailyscore.where(user_id: @user.id).where(date: (0.days.ago.localtime.beginning_of_day)..0.days.ago.localtime.end_of_day).first.total_score
    home_scores_hash["Today-Incomplete"] = (100 - home_scores_hash["Today-Complete"])

    five_day_total = 0
    count = 0
    5.times do
      score = Dailyscore.where(user_id: @user.id).where(date: (count.days.ago.localtime.beginning_of_day)..count.days.ago.localtime.end_of_day).first.total_score
      five_day_total += score
      count += 1
    end
    average = (five_day_total / 5)
    home_scores_hash["Five-Day-Complete"] = average
    home_scores_hash["Five-Day-Incomplete"] = (100 - average)

    home_scores_hash
  end

end
