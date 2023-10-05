# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all # everybody have the read access to everything

    return unless user.present? # if the user is authenticated then return the ability object instead of returning an error
    can :delete, [Post, Comment, Like], author_id_id: user.id

    return unless user.role == 'admin' # if the user is admin then return the ability object instead of returning an error
    can :manage, :all
  end
end
