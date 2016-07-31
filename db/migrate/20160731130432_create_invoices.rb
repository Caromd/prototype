class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :user, index: true, foreign_key: true
      t.references :contract, index: true, foreign_key: true
      t.date :invoice_date
      t.string :invoice_number
      t.text :comments

      t.timestamps null: false
    end
  end
end
