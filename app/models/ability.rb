class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_attribute? :admin
      can :manage, :all
    # elsif user == current_user
    #   can :manage, Post
    end
  end
end
