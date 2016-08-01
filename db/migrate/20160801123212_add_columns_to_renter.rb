class AddColumnsToRenter < ActiveRecord::Migration
  def change
    add_column :renters, :residential_address1, :string
    add_column :renters, :residential_address2, :string
    add_column :renters, :suburb, :string
    add_column :renters, :city, :string
    add_column :renters, :province, :string
    add_column :renters, :landline, :string
    add_column :renters, :date_drivers_licence_expires, :date
    add_column :renters, :payment_method, :string
    add_column :renters, :consent_to_credit_check, :boolean
    add_column :renters, :net_monthly_household_income, :integer
    add_column :renters, :max_rental_approved, :integer
    add_column :renters, :clean_credit_record, :boolean
  end
end
