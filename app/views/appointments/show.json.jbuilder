json.array! @appointment do |appointment|
  json.id appointment.id
  json.start_at appointment.start_at
  json.end_at appointment.end_at
  json.patient_id appointment.patient_id
  json.staff_member_id appointment.staff_member_id
end