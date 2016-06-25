json.array!(@personal_habits) do |personal_habit|
  json.extract! personal_habit, :id
  json.url personal_habit_url(personal_habit, format: :json)
end
