# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

plan = Plan.create(plan_name: "Daily Success Plan")

Habit.create(name: "Rise at 7:00 AM")
Habit.create(name: "Make your bed")
Habit.create(name: "Motivational Mantra")
Habit.create(name: "Update to do list")
Habit.create(name: "Say 'Thank you' ten times")
Habit.create(name: "Genuinely compliment five people")
Habit.create(name: "Greet people by their first name")
Habit.create(name: "Evening review: To do list", completed: "False")
Habit.craete(name: "Write down what you learned today")
Habit.create(name: "Pick out tomorrows outfit")
Habit.create(name: "'If I live everyday the same way I did today, what future would that create?'")

Planhabit.create(plan_id: plan.id, habit_id: 1)
Planhabit.create(plan_id: plan.id, habit_id: 2)
Planhabit.create(plan_id: plan.id, habit_id: 3)
Planhabit.create(plan_id: plan.id, habit_id: 4)
Planhabit.create(plan_id: plan.id, habit_id: 5)
Planhabit.create(plan_id: plan.id, habit_id: 6)
Planhabit.create(plan_id: plan.id, habit_id: 7)
Planhabit.create(plan_id: plan.id, habit_id: 8)
Planhabit.create(plan_id: plan.id, habit_id: 9)
Planhabit.create(plan_id: plan.id, habit_id: 10)
Planhabit.create(plan_id: plan.id, habit_id: 11)
