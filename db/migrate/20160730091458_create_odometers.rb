class CreateOdometers < ActiveRecord::Migration
  def change
    create_table :odometers do |t|
      t.references :user, index: true, foreign_key: true
      t.references :contract, index: true, foreign_key: true
      t.date :odometer_date
      t.integer :odometer_reading

      t.timestamps null: false
    end
  end
end
