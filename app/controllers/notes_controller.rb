class NotesController < ApplicationController
  before_action :authorized
  before_action :set_note, only: [:show, :update, :destroy]

  # GET /notes
  def index
    @notes = Note.where(user_id: @user.id)
  end

  # GET /notes/1
  def show
    authorize @note
  end

  # POST /notes
  def create
    @note = Note.new(note_params)
    @note.user_id = @user.id

    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
  end

  # another field on our notes:

    # Only allow a list of trusted parameters through.
  def note_params
    params.require(:note).permit(:message, :user_id)
  end
end
