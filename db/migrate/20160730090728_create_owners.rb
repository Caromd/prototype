class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :mobile
      t.string :email

      t.timestamps null: false
    end
  end
end
