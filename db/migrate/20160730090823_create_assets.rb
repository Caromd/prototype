class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.references :user, index: true, foreign_key: true
      t.references :owner, index: true, foreign_key: true
      t.string :make
      t.string :model
      t.date :first_registration_date
      t.string :colour
      t.string :registration_number
      t.string :vin_number
      t.string :engine_number
      t.decimal :purchase_price
      t.date :date_of_purchase

      t.timestamps null: false
    end
  end
end
