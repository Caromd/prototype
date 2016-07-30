class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :asset, index: true, foreign_key: true
      t.references :renter, index: true, foreign_key: true
      t.string :status
      t.string :type_of_contract
      t.string :monthly_rental_rate
      t.date :collection_date
      t.integer :term
      t.integer :monthly_km_allowance

      t.timestamps null: false
    end
  end
end
