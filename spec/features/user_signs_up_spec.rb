require 'rails_helper'

feature 'User signs up', %Q{
As a user
I want to sign in
So that my questions and answers can be associated to me.
} do

  scenario 'user provides valid information' do
    visit root_path
    click_on "Sign Up"

    fill_in "First Name", with: "Paul"
    fill_in "Last Name", with: "Parmesan"
    fill_in "Email", with: "pparmasean@privateeyes.com"
    fill_in "Password", with: "supersecret"
    fill_in "Password confirmation", with: "supersecret"
    click_on "Sign up"

    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario 'user passwords do not match' do
    visit root_path
    click_on "Sign Up"

    fill_in "First Name", with: "Paul"
    fill_in "Last Name", with: "Parmesan"
    fill_in "Email", with: "pparmasean@privateeyes.com"
    fill_in "Password", with: "supersecret"
    fill_in "Password confirmation", with: "doesnotmatch"
    click_on "Sign up"

    expect(page).to have_content "Password confirmation doesn't match"
  end

  scenario 'user email is already registered' do
    existing_user = User.create(first_name: "Paul", last_name: "Parmesan",
    email: "pparmasean@privateeyes.com",
    password: "supersecret"
    )
    visit root_path
    click_on "Sign Up"

    fill_in "First Name", with: existing_user.first_name
    fill_in "Last Name", with: existing_user.last_name
    fill_in "Email", with: existing_user.email
    fill_in "Password", with: existing_user.password
    fill_in "Password confirmation", with: existing_user.password
    click_on "Sign up"

    expect(page).to have_content "Email has already been taken"
  end

  scenario 'user email is formatted incorrectly' do
    visit root_path
    click_on "Sign Up"

    fill_in "First Name", with: "Paul"
    fill_in "Last Name", with: "Parmesan"
    fill_in "Email", with: "pparma"
    fill_in "Password", with: "supersecret"
    fill_in "Password confirmation", with: "doesnotmatch"
    click_on "Sign up"
    expect(page).to have_content "Email is invalid"
  end

  scenario 'user is able to log out' do
    visit root_path
    click_on "Sign Up"

    fill_in "First Name", with: "Paul"
    fill_in "Last Name", with: "Parmesan"
    fill_in "Email", with: "pparmasean@privateeyes.com"
    fill_in "Password", with: "supersecret"
    fill_in "Password confirmation", with: "supersecret"
    click_on "Sign up"

    visit root_path
    click_link('user_logout')

    visit root_path
    click_on "Sign In"

    fill_in "Email", with: "pparmasean@privateeyes.com"
    fill_in "Password", with: "supersecret"
    click_on "Log in"
    expect(page).to have_content "Signed in successfully."

    visit root_path
    click_link('user_logout')
    expect(page).to have_content "Signed out successfully."
  end
end
