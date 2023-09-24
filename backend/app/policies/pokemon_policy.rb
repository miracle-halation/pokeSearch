class PokemonPolicy < ApplicationPolicy
  attr_reader :user, :pokemon

  def initialize(user, pokemon)
    raise Pundit::NotAuthorizedError unless user

    super
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.leader? || user.manager?
  end

  def update?
    user.manager?
  end

  def destroy?
    user.manager?
  end

  def search?
    true
  end
end
