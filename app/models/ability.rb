# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    alias_action :create, :read, :update, :to => :patient
    alias_action :create, :read, :update, :delete, :destroy, :edit, :to => :staff_member

    if user.role == "patient"
      can [:patient], Appointment, patient_id: user.id
    end  

    if user.role == "staff_member"
      can [:staff_member], Appointment, staff_member_id: user.id
    end  

    if user.role == "super"
      can :manage, :all
    end  
  end
end
