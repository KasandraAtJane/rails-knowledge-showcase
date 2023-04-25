class AddForeignKeysToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :appointments, :users, column: :patient_id
    add_foreign_key :appointments, :users, column: :staff_member_id
  end
end
