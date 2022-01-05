class NotesController < ApplicationController
  before_action :set_note, only: [:show]
  
  def index
    @notes = current_user.notes
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    note = current_user.notes.build(note_params)

    if !note.save!
      redirect_to new_note_path
    end

    redirect_to note
  end

  private
  def note_params
    params.require(:note).permit(:title, :content)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
