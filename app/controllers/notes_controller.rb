class NotesController < ApplicationController
  before_action :authorized
  before_action :set_note, only: [:show, :update, :destroy]
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  # GET /notes
  def index
    @notes = policy_scope(Note)
  end

  # GET /notes/1
  def show
    authorize @note
  end

  # POST /notes
  def create
    @note = Note.new(note_params)
    @note.user_id = @user.id
    authorize @note

    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    authorize @note
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    authorize @note
    @note.destroy
  end

  def send_sharing_email
    # sends an email containing info about the note
  end

  def destroy_all_notes
    # destroys all notes
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
    puts params
  end

  # another field on our notes:

    # Only allow a list of trusted parameters through.
  def note_params
    params.require(:note).permit(:message, :user_id)
  end
end
