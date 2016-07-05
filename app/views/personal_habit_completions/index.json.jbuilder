json.array!(@personal_habit_completions) do |personal_habit_completion|
  json.extract! personal_habit_completion, :id
  json.url personal_habit_completion_url(personal_habit_completion, format: :json)
end
