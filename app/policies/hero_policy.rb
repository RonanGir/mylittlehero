class HeroPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    relative? && (relative.admin? || relative.editor? || relative.viewer?)
  end

  def index?
    relative? && (relative.admin? || relative.editor? || relative.viewer?)
  end

  def create?
    relative? && relative.admin?
  end

  def update?
    relative? && relative.admin?
  end

  def destroy?
    relative? && relative.admin?
  end

  private

  def relative?
    relative != nil
  end

  def relative
    @relative ||= record.relatives.find_by_user_id(user.id)
  end
end


