require 'rails_helper'

feature 'User signs in' do
  scenario 'successfully' do
    @user ||= FactoryBot.create :user
    visit root_path
    click_on 'Sign in'
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_on 'Log in'
    expect(page).to have_css 'nav li a', text: 'Sign out'
  end

  scenario 'unsuccessfully with wrong password' do
    @user ||= FactoryBot.create :user
    visit root_path
    click_on 'Sign in'
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: Faker::Internet.password
    click_on 'Log in'
    expect(page).to have_css 'nav li a', text: 'Sign in'
  end
end