require 'rails_helper'

feature 'User sees own notes' do
  scenario "sees own but not others'" do
    @other_user ||= FactoryBot.create :user
    note = @other_user.notes.build(title: 'Other note', content: 'Other note')
    note.save!
    @user ||= FactoryBot.create :user
    note = @user.notes.build(title: 'My note', content: 'My note')
    note.save!
    sign_in @user
    visit notes_path
    expect(page).to have_css '.note .title', text: 'My note'
    expect(page).not_to have_css '.note .title', text: 'Other note'
  end
end