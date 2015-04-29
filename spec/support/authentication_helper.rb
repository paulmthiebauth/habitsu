module AuthenticationHelper
  def sign_in_as(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

  def user_sign_up
    visit root_path
    click_on 'Sign Up'
    fill_in 'First Name', with: 'Paul'
    fill_in 'Last Name', with: 'Parmesan'
    fill_in 'Email', with: 'pparma@privateeyes.com'
    fill_in 'Password', with: 'supersecret'
    fill_in 'Password confirmation', with: 'supersecret'
    click_on 'Sign up'
  end

  def user_sign_up_invalid_password
    visit root_path
    click_on 'Sign Up'
    fill_in 'First Name', with: 'Paul'
    fill_in 'Last Name', with: 'Parmesan'
    fill_in 'Email', with: 'pparma@privateeyes.com'
    fill_in 'Password', with: 'supersecret'
    fill_in 'Password confirmation', with: 'super'
    click_on 'Sign up'
  end

  def user_sign_up_invalid_email
    visit root_path
    click_on 'Sign Up'
    fill_in 'First Name', with: 'Paul'
    fill_in 'Last Name', with: 'Parmesan'
    fill_in 'Email', with: 'pparmas'
    fill_in 'Password', with: 'supersecret'
    fill_in 'Password confirmation', with: 'supersecret'
    click_on 'Sign up'
  end
end
