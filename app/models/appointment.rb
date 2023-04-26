class Appointment < ApplicationRecord
  # patient cannot have multiple appointments that overlap with each other
  # commenting out for now, as it prevents me from importing the csv
  validate :appointment_cannot_be_booked_in_the_past, unless: :is_imported_appointment?

  # appointment cannot be created in the past
  # commenting out for now, as it prevents me from importing the csv
  validate :patient_own_appointments_cannot_overlap, unless: :is_imported_appointment?

  belongs_to :patient, class_name: 'User'
  belongs_to :staff_member, class_name: 'User'


  attribute :duration, :integer
  attribute :patient_name, :string
  attribute :staff_member_name, :string

  def duration
    ((end_at - start_at) / 60).to_i
  end

  def staff_member_name
    staff_member.name
  end

  def patient_name
    patient.name
  end
end

private

def patient_own_appointments_cannot_overlap
  overlapping_appointments = Appointment.where(patient_id: patient_id)
                                        .where.not(id: id) # makes sure the current appointment is not ruling itself out
                                        .where('start_at < ?', end_at)
                                        .where('end_at > ?', start_at)
  errors.add(:base, 'Cannot have two appointments at the same time') if overlapping_appointments.exists?
end

def appointment_cannot_be_booked_in_the_past
  errors.add(:start_at, 'Appointment cannot be booked in the past') if start_at.present? && start_at < Date.today
end

def is_imported_appointment
  is_imported_appointment
end