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


plan2 = Plan.create(plan_name: "Launch Prep-Standard", author: "Paul M. Thiebauth", author_info: "Web Developer - Boston, MA")
habit12 = Habit.create(name:"Read Launcher material for 30 mins")
habit13 = Habit.create(name:"Practice coding for 45 mins")
habit14 = Habit.create(name:"Create 5 new Ruby/Rails flashcards")
habit15 = Habit.create(name:"Study flashcards for 10 minutes")
habit16 = Habit.create(name:"Write down what you learned today")


Planhabit.create(plan_id: plan2.id, habit_id: habit4.id)
Planhabit.create(plan_id: plan2.id, habit_id: habit12.id)
Planhabit.create(plan_id: plan2.id, habit_id: habit13.id)
Planhabit.create(plan_id: plan2.id, habit_id: habit14.id)
Planhabit.create(plan_id: plan2.id, habit_id: habit15.id)
Planhabit.create(plan_id: plan2.id, habit_id: habit16.id)


plan3 = Plan.create(plan_name: "Launch Prep-Elite Edition", author: "Paul M. Thiebauth", author_info: "Web Developer - Boston, MA")

habit17 = Habit.create(name:"Read Launcher material for 1hr")
habit18 = Habit.create(name:"Practice coding for 2hrs")
habit19 = Habit.create(name:"Create 10 new Ruby/Rails flashcards")
habit20 = Habit.create(name:"Study flashcards for 20 minutes")
habit21 = Habit.create(name:"Write down what you learned today")

Planhabit.create(plan_id: plan3.id, habit_id: habit4.id)
Planhabit.create(plan_id: plan3.id, habit_id: habit17.id)
Planhabit.create(plan_id: plan3.id, habit_id: habit18.id)
Planhabit.create(plan_id: plan3.id, habit_id: habit19.id)
Planhabit.create(plan_id: plan3.id, habit_id: habit20.id)
Planhabit.create(plan_id: plan3.id, habit_id: habit21.id)

plan4 = Plan.create(plan_name: "Launch Prep-Beastmode", author: "Paul M. Thiebauth", author_info: "Web Developer - Boston, MA")

habit22 = Habit.create(name:"Read Launcher material for 1.5hrs")
habit23 = Habit.create(name:"Practice coding for 3hrs")
habit24 = Habit.create(name:"Create 20 new Ruby/Rails flashcards")
habit25 = Habit.create(name:"Study flashcards for 35 minutes")
habit26 = Habit.create(name:"Write down what you learned today")

Planhabit.create(plan_id: plan4.id, habit_id: habit4.id)
Planhabit.create(plan_id: plan4.id, habit_id: habit22.id)
Planhabit.create(plan_id: plan4.id, habit_id: habit23.id)
Planhabit.create(plan_id: plan4.id, habit_id: habit24.id)
Planhabit.create(plan_id: plan4.id, habit_id: habit25.id)
Planhabit.create(plan_id: plan4.id, habit_id: habit26.id)
