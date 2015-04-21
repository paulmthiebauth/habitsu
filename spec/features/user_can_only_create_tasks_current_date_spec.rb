require 'rails_helper'

feature 'User can only create tasks for current date', %Q{
  As a user
I should only be able to add tasks for the current date
} do

describe "completing task items" do
  let(:user) { FactoryGirl.create(:user) }
    scenario "I can see yesterdays tasks by clicking on button" do
    sign_in_as(user)
    visit user_path(user)
    click_link("previous-tasks")
    expect(page).to_not have_button('new_task_button')
    end
end
end
