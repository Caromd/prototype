class AddColumnsToOwner < ActiveRecord::Migration
  def change
    add_column :owners, :legal_entity, :string
    add_column :owners, :id_number, :string
    add_column :owners, :registered_name, :string
    add_column :owners, :trading_name, :string
    add_column :owners, :registration_number, :string
    add_column :owners, :residential_address1, :string
    add_column :owners, :residential_address2, :string
    add_column :owners, :suburb, :string
    add_column :owners, :city, :string
    add_column :owners, :province, :string
    add_column :owners, :landline, :string
    add_column :owners, :service_required, :string
    add_column :owners, :agent, :string
    add_column :owners, :rebate_rate, :decimal
    add_column :owners, :vat_number, :string
    add_column :owners, :bank, :string
    add_column :owners, :type_of_account, :string
    add_column :owners, :branch_code, :string
    add_column :owners, :account_number, :string
    add_column :owners, :contact_name, :string
    add_column :owners, :contact_surname, :string
    add_column :owners, :contact_telephone_number, :string
    add_column :owners, :contact_email_address, :string
  end
end
