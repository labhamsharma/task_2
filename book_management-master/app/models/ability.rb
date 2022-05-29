# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
  # Define abilities for the passed in user here. For example:
  #
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, Book
      can [:index,:update_status,:issued_book], BookRequest

    else
      can [:index, :show], Book
      can  [:index,:show,:update,:destroy,:new,:create,:edit], BookRequest 
    end
  end
end
