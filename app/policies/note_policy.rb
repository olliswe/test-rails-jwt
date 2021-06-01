class NotePolicy
  def initialize(user, note)
    @user = user
    @note = note
  end

  def show?
    @note.user_id == @user.id
  end

  def update?
    @note.user_id == @user.id
  end

  def destroy?
    @note.user_id == @user.id
  end

  def create?
    @note.user_id == @user.id
  end

  def can_see_author?
    @user.is_admin
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if  @user.is_admin
        return @scope.all
      end
      @scope.where(user_id:@user.id)
    end
  end
end
