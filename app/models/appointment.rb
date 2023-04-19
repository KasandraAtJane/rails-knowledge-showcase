class Appointment < ApplicationRecord
  # patient cannot have multiple appointments that overlap with each other
  # appointment cannot be created in the past

  validate :appointment_cannnot_be_booked_in_the_past
  validate :patient_own_appointments_cannot_overlap
  #   validate :appointment, uniqueness: true
  validate start_at < end_at
end

def appointment
  start_at..end_at
end


private 

def patient_own_appointments_cannot_overlap

  if patient_id && appointment
    errors.add('Cannot have two appointments at the same time')
  end  
end 

def appointment_cannnot_be_booked_in_the_past
  if start_at.present? && start_at < Date.today
    errors.add(:start_at, 'Appointment cannot be booked in the past')
  end
end