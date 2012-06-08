class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.role? :guest
      # hiç bir şey yapamasın
      # FIXME: sadece / görebilsin
    end

    if user.role? :student
      # FIXME
      # can :read, EQuestion
    end


    if user.role? :author
      can :manage, User
      can :manage, Question
     
    end
  end
end
