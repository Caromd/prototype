class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.references :user, index: true, foreign_key: true
      t.references :invoice, index: true, foreign_key: true
      t.references :line_type, index: true, foreign_key: true
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
