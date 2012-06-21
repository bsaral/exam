class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.role? :student
      can :read, Question
    end

    if user.role? :author
      can :manage, Question
    end

    
  end
end
