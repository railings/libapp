Given(/^I am a guest$/) do
end

When(/^I fill the register form with valid data$/) do
  visit("/register")
  fill_in "reader_email", with: "reader01@mail.com"
  fill_in "reader_password", with: "password"
  fill_in "reader_password_confirmation", with: "password"
  click_button "Register"
end

Then(/^I should be registered in the application$/) do
  expect(Reader.find_by_email("reader01@mail.com")).not_to be_nil
end

When(/^I should be logged in$/) do
  pending
end