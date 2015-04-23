require 'rails_helper'

feature 'User can sign up for plans on plans page', %Q{
As a user
I should be able to sign up for habit/goal plans
To help me achieve my goals
} do

describe "user views plans" do

  let(:user) { FactoryGirl.create(:user) }

    scenario "I want to mark a habit as complete" do
    sign_in_as(user)
    plan = FactoryGirl.create(:plan)
    habit = FactoryGirl.create(:habit)
    dailyhabit = Dailyhabit.create(user_id: user.id, habit_id: habit.id, point_value: 0, plan_id: plan.id, date: DateTime.now)
    visit plans_path
    click_button("plan-#{plan.id}")
    click_button("#{dailyhabit.id}-complete")
    visit(current_path)
    expect dailyhabit.completed_at != nil
    end


    scenario "I want to mark a habit as complete" do
    sign_in_as(user)
    plan = FactoryGirl.create(:plan)
    habit = FactoryGirl.create(:habit)
    dailyhabit = Dailyhabit.create(user_id: user.id, habit_id: habit.id, point_value: 0, plan_id: plan.id, date: DateTime.now)
    visit plans_path
    click_button("plan-#{plan.id}")
    click_button("#{dailyhabit.id}-complete")
    visit(current_path)
    click_button("#{dailyhabit.id}-incomplete")
    visit(current_path)
    expect dailyhabit.completed_at == nil
    end


  end
end
