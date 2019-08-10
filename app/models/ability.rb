class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, Project
      can :manage, Task
    elsif user.has_role? :developer
    end    
  end
end
