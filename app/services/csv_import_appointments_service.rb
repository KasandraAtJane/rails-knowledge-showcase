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
      # add find or create by for patient and staff in case they don't exist
      Appointment.create!(appointment_hash)
      print appointment_hash
      puts appointment_hash
    end
  end
end

# start_at,start_at,start_at,staff_member_id
