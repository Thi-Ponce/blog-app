class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.user?
      can :read, :all
      can :create, Comment
      can :destroy, Comment, author_id: user.id
      can :manage, Post, author_id: user.id
      can :manage, Comment, author_id: user.id
      can :manage, Like, author_id: user.id
    end
  end
end
