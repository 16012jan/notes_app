class NotesController < ApplicationController
  before_action :note_find, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @notes = Note.where(user_id: current_user).order("created_at DESC")
  end

  def show
  end

  def new
    @note = current_user.notes.build
  end

  def create
    @note = current_user.notes.build(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note list was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_path, notice: 'Note was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def note_find
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :description, :file, :attachment, :user_id)
  end
end
