class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # attr_accessor :role

  devise :database_authenticatable, :registerable

  # has_many :appointments_as_patient, class_name: 'Appointment', foreign_key: 'patient_id'
  # has_many :appointments_as_staff_member, class_name: 'Appointment', foreign_key: 'staff_member_id'

  has_many :patient_appointments, foreign_key: 'patient_id', class_name: 'Appointment'
  has_many :staff_member_appointments, foreign_key: 'staff_member_id', class_name: 'Appointment'

  ROLES = %(super staff_member patient)
end
