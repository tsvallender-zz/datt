require 'rails_helper'

feature 'User marks a todo done' do
  scenario "on show page" do
    @user ||= FactoryBot.create :user
    todo = @user.notes.build(
      title: 'My todo', content: 'My todo',
      type: 'Todo', due_date: Date.tomorrow)
    todo.save!
    sign_in @user
    visit todo_path(todo.id)
    expect(page).to have_unchecked_field 'Done?'
    page.check 'Done?'
    click_on 'Update' # Manual as no JavaScript
    visit todo_path(todo.id)
    expect(page).to have_checked_field 'Done?'
  end

  scenario "on index page" do
    @user ||= FactoryBot.create :user
    todo = @user.notes.build(
      title: 'My todo', content: 'My todo',
      type: 'Todo', due_date: Date.tomorrow)
    todo.save!
    sign_in @user
    visit todos_path
    page.check 'note_' + todo.id.to_s + '_done'
    click_on 'submit_'+todo.id.to_s # Manual as no JavaScript
    visit todo_path(todo.id)
    expect(page).to have_checked_field 'note_' + todo.id.to_s + '_done'
  end
end