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
      cannot :edit, Ad.where(state: 'published')
      cannot :edit, Ad.where(state: 'new')
      cannot :edit, Ad.where(state: 'approved')
      cannot :edit, Ad.where(state: 'archival')
    end
  end
end
