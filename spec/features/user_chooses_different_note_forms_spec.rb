require 'rails_helper'

feature 'User chooses note type' do
  scenario 'successfully' do
    @user ||= FactoryBot.create :user
    sign_in @user
    visit root_path
    click_on 'New note'
    expect(page).to have_css 'h2', text: 'New note'
    click_on id: 'todo'
    expect(page).to have_css 'label', text: 'Due date'
    click_on id: 'note'
    expect(page).not_to have_css 'label', text: 'Due date'
  end
end
