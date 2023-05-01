# frozen_string_literal: true

class Ability
  include CanCan::Ability

#   def initialize(user)
#     user ||= User.new

#     puts "Current User: #{user.inspect}"

#     if user.role == 'patient'
#       can :manage, Appointment, patient_id: user.id
#     elsif user.role == 'staff_member'
#       can :manage, Appointment, staff_member_id: user.id
#     elsif user.role == 'super'
#       can :manage, :all
#     end
#   end
# end
# end


# class Ability
#   include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :create, :read, :update, to: :patient
    alias_action :create, :read, :update, :delete, :destroy, :edit, to: :staff_member

    if user.role == 'patient'
      puts "current user is a patient #{user.role}"
      can [:patient], Appointment, patient_id: user.id
    elsif user.role == 'staff_member'
      puts "current user is a staff member #{user.role}"
      can [:staff_member], Appointment, staff_member_id: user.id
    elsif user.role == 'super'
      puts "current user is a super user #{user.role}"
      can :manage, :all
    end
  end
end
