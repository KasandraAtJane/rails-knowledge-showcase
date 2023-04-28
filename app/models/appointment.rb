class Appointment < ApplicationRecord
  # patient cannot have multiple appointments that overlap with each other
  # commenting out for now, as it prevents me from importing the csv
  validate :appointment_cannot_be_booked_in_the_past, unless: :is_imported_appointment?

  # appointment cannot be created in the past
  # commenting out for now, as it prevents me from importing the csv
  validate :patient_own_appointments_cannot_overlap, unless: :is_imported_appointment?

  belongs_to :patient, class_name: 'User', foreign_key: 'patient_id'
  belongs_to :staff_member, class_name: 'User', foreign_key: 'staff_member_id'
  # belongs_to :super_user, class_name: 'User'

  delegate :role, to: :user, prefix: true

  # to display duration without needed an additional db column.
  attribute :duration, :integer
  attribute :patient_name, :string
  attribute :staff_member_name, :string
  attribute :role, :string

  def duration
    ((end_at - start_at) / 60).to_i
  end

  def staff_member_name
    staff_member.name
  end

  def patient_name
    patient.name
  end

  # def role
  #   if super_user
  #     super_user.role
  #   elsif staff_member
  #     staff_member.role
  #   else
  #     patient.role
  #   end
  # end

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

  def is_imported_appointment?
    is_imported_appointment
  end
end
