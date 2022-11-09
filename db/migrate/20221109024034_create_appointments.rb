class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.integer :doctor_id, null: false
      t.integer :user_id, null: false
      t.string :complaint, null: false
      t.string :recomendation
      t.boolean :active, null: false, default: true
      t.datetime :desired_time, null: false

      t.timestamps
    end
  end
end
