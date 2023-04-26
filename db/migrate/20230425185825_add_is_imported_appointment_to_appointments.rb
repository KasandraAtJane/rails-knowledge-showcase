class AddIsImportedAppointmentToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :is_imported_appointment, :boolean, default: false
  end
end
