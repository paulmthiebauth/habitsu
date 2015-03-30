require 'rails_helper'

feature 'User signs up and posts question', %Q{
  As a user
  I want to post a question
  So that I can receive help from others
} do


scenario 'user properly fills out form and posts a question' do
visit root_path
click_on "Sign Up"

fill_in "First Name", with: "Paul"
fill_in "Last Name", with: "Parmesan"
fill_in "Email", with: "pparmasean@privateeyes.com"
fill_in "Password", with: "supersecret"
fill_in "Password confirmation", with: "supersecret"
click_on "Sign up"

click_on "Ask A Question"
fill_in "Title", with: "How can I continue to improve my ruby skills after I finish at Launch Academy?"
fill_in "Body", with: "KLASJDFLKASJDFLKASDLKFASLKDF289JR893J49283J49823J4982J3498J29384J2938J49283J4982J3948J23984J9283J4982J34982J3948J29384J2938J49823J4982J3948J23984J29384J2983J49283J4982J34982J3948J29384J29384J9283J49283J49238J492834"
click_on "Ask Question"
expect(page).to have_content "How can I continue to improve my ruby skills"
end

scenario 'user fails to properly fill out question form' do
visit root_path
click_on "Sign Up"

fill_in "First Name", with: "Paul"
fill_in "Last Name", with: "Parmesan"
fill_in "Email", with: "pparmasean@privateeyes.com"
fill_in "Password", with: "supersecret"
fill_in "Password confirmation", with: "supersecret"
click_on "Sign up"

click_on "Ask A Question"
fill_in "Title", with: "How can I continue to improvLaunch Academy?"
fill_in "Body", with: "283J49283J49238J492834"
click_on "Ask Question"
expect(page).to have_content "Body is too short"

end

end
