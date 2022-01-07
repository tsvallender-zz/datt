require 'rails_helper'

feature 'User creates note' do
  scenario 'successfully' do
    @user ||= FactoryBot.create :user
    sign_in @user
    visit root_path
    click_on 'New note'
    expect(page.title).to include 'New note'
    expect(page).to have_css 'h2', text: 'New note'
    fill_in 'note_title', with: 'Test note'
    fill_in 'note_content', with: 'Test note content'
    expect { click_on 'Create note' }.to change { Note.count }.by(1)
    expect(page).to have_css 'h2', text: 'Test note'
    expect(page).to have_css '.note .content', text: 'Test note content'
  end
end