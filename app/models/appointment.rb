class Appointment < ApplicationRecord
  # patient cannot have multiple appointments that overlap with each other
  # appointment cannot be created in the past

  # validate :appointment_cannot_be_booked_in_the_past
  # validate :patient_own_appointments_cannot_overlap
  #   validate :appointment, uniqueness: true
  #   validate start_at < end_at
end

def appointment
  start_at..end_at
end

private

def patient_own_appointments_cannot_overlap
  errors.add('Cannot have two appointments at the same time') if patient_id && appointment
end

def appointment_cannot_be_booked_in_the_past
  errors.add(:start_at, 'Appointment cannot be booked in the past') if start_at.present? && start_at < Date.today
end
