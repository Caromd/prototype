class AddColumnsToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :return_date, :date
    add_column :contracts, :initial_odometer_reading, :integer
    add_column :contracts, :daily_km_allowance, :integer
    add_column :contracts, :payment_day, :integer
    add_column :contracts, :payment_method, :string
    add_column :contracts, :additional_drivers, :string
    add_column :contracts, :deposit_sum_held, :integer
    add_column :contracts, :deposit_at_risk, :integer
    add_column :contracts, :late_payment_flag, :boolean
  end
end
