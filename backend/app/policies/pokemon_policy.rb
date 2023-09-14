class PokemonPolicy < ApplicationPolicy
  attr_reader :user, :pokemon

  def initialize(user, pokemon)
    raise Pundit::NotAuthorizedError unless user

    super
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
end
