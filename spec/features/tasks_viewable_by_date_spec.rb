require 'rails_helper'

feature 'tasks can be sorted by day they were created' do

  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario "I see just today's tasks" do
      todays_task = FactoryGirl.create(:task, user: user, name: 'Todays task')
      yesterdays_task = FactoryGirl.create(:task, user: user, created_at: 1.day.ago, name: 'Yesterdays task')

      visit user_path(user)

      expect(page).to have_content('Todays task')
      expect(page).to_not have_content('Yesterdays task')
    end

    scenario "I can see yesterdays tasks by clicking on button"

  end

  context 'as a visitor' do
    scenario 'I get redirected to sign in' do
      user = FactoryGirl.create(:user)
      visit user_path(user)

      expect(page).to have_content("You need to sign in or sign up before continuing")
    end
  end
end
