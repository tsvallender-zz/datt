require 'rails_helper'

feature 'User views a todo' do
  scenario "successfully" do
    @user ||= FactoryBot.create :user
    todo = @user.notes.build(
      title: 'My todo', content: 'My todo',
      type: 'Todo', due_date: Date.tomorrow)
    todo.save!
    sign_in @user
    visit todo_path(todo.id)
    expect(page).to have_css 'h2', text: 'My todo'
    expect(page).to have_css '.note .content', text: 'My todo'
    expect(page).to have_css '.note .due_date'
    expect(page).to have_css 'input[type=checkbox]'
  end
end