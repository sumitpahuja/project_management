class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, Project
    elsif user.has_role? :developer
      can :read, Task
    end    
  end
end
