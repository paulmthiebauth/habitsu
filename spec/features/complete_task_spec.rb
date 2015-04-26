require 'rails_helper'

feature 'User marks a task as complete or incomplete', %Q{
As a user
I want to be able to mark a task as complete
So that I do not repeat the task

I want to be able to mark a task as incomplete
} do

describe "completing task items" do

scenario 'is successful when marking a single item complete' do
  visit 'users/sign_up'
  fill_in "First Name", with: "Paul"
  fill_in "Last Name", with: "Parmesan"
  fill_in "Email", with: "pparmasean@privateeyes.com"
  fill_in "Password", with: "supersecret"
  fill_in "Password confirmation", with: "supersecret"
  click_on "Sign up"
  new_id = User.last.id
  new_task = Task.create(user_id: new_id, name: "Go to the store", completed: "False")
  expect(new_task.completed_at).to be_nil
  visit "/users/#{new_id}"
  expect(page).to have_content "Go to the store"
  click_link("task-#{new_task.id}-complete")
  expect(page).to have_content "Task complete"
  end

scenario 'is successful when marking a single item incomplete' do
  visit 'users/sign_up'
  fill_in "First Name", with: "Paul"
  fill_in "Last Name", with: "Parmesan"
  fill_in "Email", with: "pparmasean@privateeyes.com"
  fill_in "Password", with: "supersecret"
  fill_in "Password confirmation", with: "supersecret"
  click_on "Sign up"
  new_id = User.last.id
  new_task = Task.create(user_id: new_id, name: "Go to the store", completed: "False")
  expect(new_task.completed_at).to be_nil
  visit "/users/#{new_id}"
  click_link("task-#{new_task.id}-complete")
  click_link("task-#{new_task.id}-incomplete")
  expect(page).to have_content "Task updated"
  end

end
end
