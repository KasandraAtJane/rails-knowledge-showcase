class Appointment < ApplicationRecord
  validate :appointment_date_cannnot_be_in_the_past
  validate appointments_cannot_overlap
 
    # Add the following validations: A patient cannot have multiple appointments 
    # that overlap with each other and an appointment cannot be created in the past
end

def appointments_cannot_overlap
    
end   

def appointment_date_cannnot_be_in_the_past
  if start_time.present? && start_time_date < Date.today
    errors.add(:start_time, 'Appointment cannot be booked in the past')
  end
end