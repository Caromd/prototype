class CreateLineTypes < ActiveRecord::Migration
  def change
    create_table :line_types do |t|
      t.references :user, index: true, foreign_key: true
      t.string :line_type
      t.string :description

      t.timestamps null: false
    end
  end
end
