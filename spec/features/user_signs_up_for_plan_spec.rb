require 'rails_helper'

feature 'User can sign up for plans on plans page', %Q{
As a user
I should be able to sign up for habit/goal plans
To help me achieve my goals
} do

describe "user views plans" do

  let(:user) { FactoryGirl.create(:user) }


    scenario "I view plans page to see a list of plan" do
    plan = FactoryGirl.create(:plan)
    sign_in_as(user)
    visit plans_path
    expect(page).to have_content('Daily success plan')
    end

    scenario "I view plans page to sign up for a plan" do
    plan = FactoryGirl.create(:plan)
    sign_in_as(user)
    visit plans_path
    click_button("plan-#{plan.id}")
    expect(page).to have_content('Daily success plan')
    end

    scenario "I view habits after signing up for a plan" do
    sign_in_as(user)
    plan = FactoryGirl.create(:plan)
    habit = FactoryGirl.create(:habit)
    Dailyhabit.create(user_id: user.id, habit_id: habit.id, point_value: 0, plan_id: plan.id, date: DateTime.now)
    visit plans_path
    click_button("plan-#{plan.id}")
    expect(page).to have_content('Rise at 7 AM')
    end
  end
end
