class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update]
  
  def index
    @notes = current_user.notes
  end

  def show
  end

  def new
    case params[:type]
    when 'todo'
      @note = Todo.new
    else
      @note = Note.new
    end

    @note
  end

  def create
    note = current_user.notes.build(note_params)

    if !note.save!
      redirect_to new_note_path
    end

    redirect_to note
  end

  def update
    @note.update note_params

  end

  private
  def note_params
    params.require(:note).permit(:title, :content, :due_date,
                                 :type, :done)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
