require 'rails_helper'

feature 'User marks a todo done' do
  scenario "successfully" do
    @user ||= FactoryBot.create :user
    todo = @user.notes.build(
      title: 'My todo', content: 'My todo',
      type: 'Todo', due_date: Date.tomorrow)
    todo.save!
    sign_in @user
    visit todo_path(todo.id)
    expect(page).to have_unchecked_field 'Done?'
    page.check 'Done?'
    click_on 'Update Todo' # Manual as no JavaScript@
    visit todo_path(todo.id)
    expect(page).to have_checked_field 'todo_done'
  end
end