class NotePolicy
  def initialize(user, note)
    @user = user
    @note = note
  end

  def show?
    @note.user_id == @user.id
  end
end
