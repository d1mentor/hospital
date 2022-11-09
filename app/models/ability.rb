class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(Superuser)
      can :manage, :all
    elsif user.is_a?(User)
      cannot :read, Admin, user: user
      can :manage, User, user: user
    elsif user.is_a?(Doctor)
      cannot :read, Admin, user: user
      can :manage, Doctor, user: user
    else
      can :manage, :all 
    end  
  end
end
