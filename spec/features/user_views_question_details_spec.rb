require 'rails_helper'

feature 'user views question details', %Q{
  As a user
  I want to view a question's details
  So that I can effectively understand the question
} do

  scenario 'user views a questions details' do
    visit root_path
    click_on "Sign Up"

    fill_in "First Name", with: "Paul"
    fill_in "Last Name", with: "Parmesan"
    fill_in "Email", with: "pparmasean@privateeyes.com"
    fill_in "Password", with: "supersecret"
    fill_in "Password confirmation", with: "supersecret"
    click_on "Sign up"


    user = User.create(email: 'paul@launch.com', password: 'password', encrypted_password: 'password', first_name: "paul", last_name: "theebs")
    question = Question.create(user_id: user.id, title: "Yeah... Im gonna need you to come in on Saturday..ddfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdf.", body: "Greattttttdfdfdfdsfasdlfkjasdlkfjalskdfjlkasdjflkajsdlfkjasdlkfjasldfjalskdfjalsdjasdfasdfasdfasdfasdfasdfasdfasdfasdfflasdjflaksdjflkasjdflkasjdflkasjdlfkttttttttt")
    visit question_path(question)
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.body)
  end

end
