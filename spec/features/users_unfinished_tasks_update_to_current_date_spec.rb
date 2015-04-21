
require 'rails_helper'

feature 'User tasks roll over if unfinished', %Q{
As a user
I want my to do list items to roll over each day
So that I do not need to keep updating my list
} do

  describe "completing task items" do
    let(:user) { FactoryGirl.create(:user) }
    scenario "I can see yesterdays tasks by clicking on button" do
      sign_in_as(user)
      FactoryGirl.create(:task, user: user, name: 'Todays task')
      FactoryGirl.create(:task, user: user, created_at: 1.day.ago, name: 'Yesterdays task')
      visit user_path(user)
      visit(current_path)
      expect(page).to_not have_content('Yesterdays task')
    end
  end
end
