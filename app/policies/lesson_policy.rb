class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      scope.all
    end
  end

  def show?
    @user.has_role?(:admin) || @record.course.user_id == @user.id || @record.course.bought(@user) == false
  end

  def edit?
    @record.course.user_id == @user.id
  end

  def update?
    @record.course.user_id == @user.id
  end

  def new?
    #@user.has_role?(:teacher)
  end

  def create?
    #@user.has_role?(:teacher)
  end

  def destroy?
    @record.course.user_id == @user.id
  end
end