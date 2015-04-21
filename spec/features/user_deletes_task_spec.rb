require 'rails_helper'

feature 'User deletes a task', %Q{
As a user
I want to be able to delete a task
If I need to remove it from my list
} do

describe "deleting task list items" do

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
    click_button("task-#{new_task.id}-delete")
    expect(page).to have_content "Task deleted"
    end
  end

end
