class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all # everybody have the read access to everything

    # if the user is authenticated then return the ability object instead of returning an error
    return unless user.present?

    can :delete, [Post, Comment, Like], author_id_id: user.id
    can :destroy, [Comment], users_id: user.id

    # if the user is admin then return the ability object instead of returning an error
    return unless user.role == 'admin'

    can :manage, :all
  end
end
