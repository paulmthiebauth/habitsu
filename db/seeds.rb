# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

plan = Plan.create(plan_name: "Daily Success Plan")

habit1 = Habit.create(name: "Rise at 7:00 AM")
habit2 = Habit.create(name: "Make your bed")
habit3 = Habit.create(name: "Motivational Mantra")
habit4 = Habit.create(name: "Update to do list")
habit5 = Habit.create(name: "Say 'Thank you' ten times")
habit6 = Habit.create(name: "Genuinely compliment five people")
habit7 = Habit.create(name: "Greet people by their first name")
habit8 = Habit.create(name: "Evening review: To do list")
habit9 = Habit.create(name: "Write down what you learned today")
habit10 = Habit.create(name: "Pick out tomorrows outfit")
habit11 = Habit.create(name: "'If I live everyday the same way I did today, what future would that create?'")

Planhabit.create(plan_id: plan.id, habit_id: habit1.id)
Planhabit.create(plan_id: plan.id, habit_id: habit2.id)
Planhabit.create(plan_id: plan.id, habit_id: habit3.id)
Planhabit.create(plan_id: plan.id, habit_id: habit4.id)
Planhabit.create(plan_id: plan.id, habit_id: habit5.id)
Planhabit.create(plan_id: plan.id, habit_id: habit6.id)
Planhabit.create(plan_id: plan.id, habit_id: habit7.id)
Planhabit.create(plan_id: plan.id, habit_id: habit8.id)
Planhabit.create(plan_id: plan.id, habit_id: habit9.id)
Planhabit.create(plan_id: plan.id, habit_id: habit10.id)
Planhabit.create(plan_id: plan.id, habit_id: habit11.id)
