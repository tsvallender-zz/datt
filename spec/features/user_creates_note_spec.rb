require 'rails_helper'
require 'date'

feature 'User creates note', js: true do
  scenario 'successfully' do
    @user ||= FactoryBot.create :user
    sign_in @user
    create_note
  end

  scenario 'as a todo' do
    @user ||= FactoryBot.create :user
    sign_in @user
    create_note(type: :todo, fields:
      {
        'Due date': Date.tomorrow
      })
  end
end

def create_note(type: :note, fields: {})
  visit root_path
  click_on 'New note'
  expect(page.title).to include 'New note'
  expect(page).to have_css 'h2', text: 'New note'
  case type
  when :todo
    click_on id: 'todo'
    expect(page).to have_css 'label', text: 'Due date'
  end

  fill_in 'Title', with: 'Test note'
  find(:css, '#note_content').click.set('Test note content')
  fields.each do | field, data |
    fill_in field, with: data
  end

  expect { click_on 'Create note' }.to change { Note.count }.by(1)
  expect(page).to have_css 'h2', text: 'Test note'
  expect(page).to have_css '.note .content', text: 'Test note content'
  fields.each do | field, data |
    class_name = '.' + field.to_s.tr(' ', '_').downcase
    expect(page).to have_css '.note ' + class_name, text: data.to_s
  end
end
