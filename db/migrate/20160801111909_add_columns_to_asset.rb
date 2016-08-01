class AddColumnsToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :status, :string
    add_column :assets, :full_service_history, :boolean
    add_column :assets, :rental_date_available_to, :date
    add_column :assets, :rental_date_available_from, :date
    add_column :assets, :service_intervals, :integer
    add_column :assets, :warranty, :boolean
    add_column :assets, :warranty_start_date, :date
    add_column :assets, :warranty_end_date, :date
    add_column :assets, :warranty_km, :integer
    add_column :assets, :service_plan, :boolean
    add_column :assets, :service_plan_start_date, :date
    add_column :assets, :service_plan_end_date, :date
    add_column :assets, :service_plan_km, :integer
    add_column :assets, :insurer, :string
    add_column :assets, :policy_number, :string
    add_column :assets, :roadside_assistance_provider, :string
    add_column :assets, :roadside_assistance_number, :string
    add_column :assets, :date_loaded_on_system, :date
    add_column :assets, :vehicle_license_expiry_date, :date
    add_column :assets, :date_of_next_service, :date
    add_column :assets, :km_next_service, :integer
    add_column :assets, :date_of_last_service, :date
    add_column :assets, :etag, :boolean
    add_column :assets, :etag_number, :string
  end
end
