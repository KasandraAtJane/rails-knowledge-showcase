json.array! @appointment do |appointment|
  json.id appointment.id
  json.patient_id appointment.patient_id
  json.staff_member_id appointment.staff_member_id
  json.patient.name appointment.patient.try(:name)
  json.staff_member.name appointment.staff_member.try(:name)
  json.start_at appointment.start_at
  json.end_at appointment.end_at
  json.duration appointment.duration
  
end