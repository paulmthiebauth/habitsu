require 'rails_helper'
feature 'User signs up', %({
As a user
I want to sign in
So that my questions and answers can be associated to me.
}) do
  scenario 'user provides valid information' do
    user_sign_up
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'user passwords do not match' do
    user_sign_up_invalid_password
    expect(page).to have_content "Password confirmation doesn't match"
  end

  scenario 'user email is already registered' do
    User.create(
      first_name: 'Paul', last_name: 'Parmesan',
      email: 'pparma@privateeyes.com',
      password: 'supersecret'
    )
    user_sign_up

    expect(page).to have_content 'Email has already been taken'
  end

  scenario 'user email is formatted incorrectly' do
    user_sign_up_invalid_email
    expect(page).to have_content 'Email is invalid'
  end

  scenario 'user is able to log out' do
    user_sign_up

    visit root_path
    click_link('user_logout')

    visit root_path
    click_on 'Sign In'

    fill_in 'Email', with: 'pparma@privateeyes.com'
    fill_in 'Password', with: 'supersecret'
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully.'

    visit root_path
    click_link('user_logout')
    expect(page).to have_content 'Signed out successfully.'
  end
end
