require 'rails_helper'

feature 'User marks a task as complete', %Q{
  As a user
I want to be able to mark a task as complete
So that I do not repeat the task
} do

describe "completing task items" do
  new_task = Task.create(user_id: 1, name: "Go to the store", completed: "False")

scenario 'is successful when marking a single item complete' do

  visit 'users/sign_up'
  fill_in "First Name", with: "Paul"
  fill_in "Last Name", with: "Parmesan"
  fill_in "Email", with: "pparmasean@privateeyes.com"
  fill_in "Password", with: "supersecret"
  fill_in "Password confirmation", with: "supersecret"
  click_on "Sign up"
  binding.pry
  new_id = User.last.id
  expect(new_task.completed_at).to be_nil
  visit "/users/#{new_id}"
  click_link "Complete"
  task.reload
  end
end
end
