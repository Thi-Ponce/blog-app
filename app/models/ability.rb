class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    # elsif user == current_user
    #   can :manage, Post
    end
  end
end
