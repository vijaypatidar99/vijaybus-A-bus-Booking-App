# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.admin?
      can :manage, Bus
      can :manage, Route
      can :manage, Ticket
      can :approve_ticket, Ticket
    else
      can :read, Bus
      can :read, Route
      can [:read, :create, :cancel_ticket], Ticket
      can :read, :my_tickets
      can :cancel_ticket, :my_tickets
    end
  end
end
