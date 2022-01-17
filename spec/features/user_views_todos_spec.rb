require 'rails_helper'

feature 'User views todos' do
  scenario "successfully" do
    @user = FactoryBot.create :user do |user|
      FactoryBot.create_list(:note, 10, user: user)
      FactoryBot.create_list(:todo, 15, user: user)
    end
    sign_in @user
    visit todos_path
    expect(page).to have_selector('h4', count: 15)
    expect(page).to have_selector('input[type=checkbox]', count: 15)
  end
end