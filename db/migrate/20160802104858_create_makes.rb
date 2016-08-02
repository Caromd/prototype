class CreateMakes < ActiveRecord::Migration
  def change
    create_table :makes do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
