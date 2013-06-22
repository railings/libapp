Given(/^I am a guest$/) do
end

When(/^I fill the register form with valid data$/) do
  visit("/register")
  fill_in "reader_email", with: 'reader01@mail.com'
  fill_in "reader_password", with: 'password'
  fill_in "reader_password_confirmation", with: 'password'
  click_button "Register"
end

Then(/^I should be registered in the application$/) do
  expect(Reader.find_by_email('reader01@mail.com')).not_to be_nil
end

When(/^I should be logged in$/) do
  expect(page).to have_content("Welcome, reader01@mail.com")
end

When(/^I fill the register form with invalid data$/) do
  visit("/register")
  fill_in "reader_email", with: "reader"
  fill_in "reader_password", with: "password"
  fill_in "reader_password_confirmation", with: "password"
  click_button "Register"
end

Then(/^I should see the register form again$/) do
  expect(page).to have_selector('form#new_reader')
end

And(/^I should not be registered in the application$/) do
   expect(Reader.find_by_email('reader')).to be_nil
end

When(/^I go to the home page$/) do
  visit root_url
end

Then(/^I should see guest menu$/) do
  expect(page).to have_selector("#top-menu")
  expect(page).to have_link('Register', href: register_path)
end

Given(/^I am "(.*?)" reader$/) do |email|
  step "reader with email \"#{email}\" exists"
  step "I fill the login form with valid data for \"#{email}\" reader"
end

Then(/^I should see "(.*?)" reader menu$/) do |email|
  expect(page).to have_content("Welcome, #{email}")
end

And(/^reader with email "(.*?)" exists$/) do |email|
  Reader.create({email: email, password: "password",
                 password_confirmation: "password"})
end

When(/^I fill the login form with valid data for "(.*?)" reader$/) do |email|
  visit("/login")
  fill_in "login_email", with: email
  fill_in "login_password", with: "password"
  click_button "Login"
end

Then(/^I should be logged in as "(.*?)" reader$/) do |email|
  expect(page).to have_content("Welcome, #{email}")
end
