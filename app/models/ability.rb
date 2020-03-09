# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
      cannot :create, Ad
    end

    if user.user?
      can :manage, Ad
      can :manage, User
    end
  end
end
