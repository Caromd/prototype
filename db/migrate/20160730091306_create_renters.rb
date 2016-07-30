class CreateRenters < ActiveRecord::Migration
  def change
    create_table :renters do |t|
      t.references :user, index: true, foreign_key: true
      t.string :status
      t.string :name
      t.string :surname
      t.string :id_number
      t.string :email
      t.string :drivers_licence

      t.timestamps null: false
    end
  end
end
