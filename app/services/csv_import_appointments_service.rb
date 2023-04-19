class CsvImportAppointmentsService
  require 'csv'

  def call(file)
    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ';')
    csv.each do |row|
      #   appointment_hash = JSON.parse(appointment.to_json)
      appointment_hash = {}
      appointment_hash[:start_at] = row['start_at']
      appointment_hash[:end_at] = row['start_at']
      appointment_hash[:patient_id] = row['start_at']
      appointment_hash[:staff_member_id] = row['staff_member_id']
      Appointment.create(appointment_hash)
      p row
    end
  end
end

# start_at,start_at,start_at,staff_member_id
