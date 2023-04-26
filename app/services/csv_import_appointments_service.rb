class CsvImportAppointmentsService
  require 'csv'
  require 'chronic'

  def call(file)
    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ',')
    csv.each do |row|
      appointment_hash = {}
      appointment_hash[:start_at] = Chronic.parse(row['start_at'])
      appointment_hash[:end_at] = Chronic.parse(row['end_at'])
      appointment_hash[:patient_id] = row['patient_id'].to_i
      appointment_hash[:staff_member_id] = row['staff_member_id'].to_i
      # allowing past dates to be imported
      appointment_hash[:is_imported_appointment] = true
      Appointment.create!(appointment_hash)
    end
  end
end
