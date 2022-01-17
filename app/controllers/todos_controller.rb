class TodosController < ApplicationController
  before_action :set_todo, only: [:update]

  def update
    @todo.update todo_params
    
    redirect_to @todo
  end

  private
  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :content, :due_date, :type, :done)
  end
end