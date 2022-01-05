require 'rails_helper'

feature 'User creates note' do
  scenario 'successfully' do
    @user ||= FactoryBot.create :user
    sign_in @user
    visit new_note_path
    expect(page).to have_css 'h2', text: 'New note'
    fill_in 'title', with: 'Test note'
    fill_in 'content', with: 'Test note content'
    expect { click_on 'submit' }.to change { Note.count }.by(1)
  end
end