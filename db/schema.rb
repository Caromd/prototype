# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160802104913) do

  create_table "assets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "owner_id"
    t.string   "make"
    t.string   "model"
    t.date     "first_registration_date"
    t.string   "colour"
    t.string   "registration_number"
    t.string   "vin_number"
    t.string   "engine_number"
    t.decimal  "purchase_price"
    t.date     "date_of_purchase"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "status"
    t.boolean  "full_service_history"
    t.date     "rental_date_available_to"
    t.date     "rental_date_available_from"
    t.integer  "service_intervals"
    t.boolean  "warranty"
    t.date     "warranty_start_date"
    t.date     "warranty_end_date"
    t.integer  "warranty_km"
    t.boolean  "service_plan"
    t.date     "service_plan_start_date"
    t.date     "service_plan_end_date"
    t.integer  "service_plan_km"
    t.string   "insurer"
    t.string   "policy_number"
    t.string   "roadside_assistance_provider"
    t.string   "roadside_assistance_number"
    t.date     "date_loaded_on_system"
    t.date     "vehicle_license_expiry_date"
    t.date     "date_of_next_service"
    t.integer  "km_next_service"
    t.date     "date_of_last_service"
    t.boolean  "etag"
    t.string   "etag_number"
  end

  add_index "assets", ["owner_id"], name: "index_assets_on_owner_id"
  add_index "assets", ["user_id"], name: "index_assets_on_user_id"

  create_table "contracts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "asset_id"
    t.integer  "renter_id"
    t.string   "status"
    t.string   "type_of_contract"
    t.string   "monthly_rental_rate"
    t.date     "collection_date"
    t.integer  "term"
    t.integer  "monthly_km_allowance"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.date     "return_date"
    t.integer  "initial_odometer_reading"
    t.integer  "daily_km_allowance"
    t.integer  "payment_day"
    t.string   "payment_method"
    t.string   "additional_drivers"
    t.integer  "deposit_sum_held"
    t.integer  "deposit_at_risk"
    t.boolean  "late_payment_flag"
  end

  add_index "contracts", ["asset_id"], name: "index_contracts_on_asset_id"
  add_index "contracts", ["renter_id"], name: "index_contracts_on_renter_id"
  add_index "contracts", ["user_id"], name: "index_contracts_on_user_id"

  create_table "invoices", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "contract_id"
    t.date     "invoice_date"
    t.string   "invoice_number"
    t.text     "comments"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "invoices", ["contract_id"], name: "index_invoices_on_contract_id"
  add_index "invoices", ["user_id"], name: "index_invoices_on_user_id"

  create_table "line_types", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "line_type"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "line_types", ["user_id"], name: "index_line_types_on_user_id"

  create_table "lines", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "invoice_id"
    t.integer  "line_type_id"
    t.decimal  "amount"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "lines", ["invoice_id"], name: "index_lines_on_invoice_id"
  add_index "lines", ["line_type_id"], name: "index_lines_on_line_type_id"
  add_index "lines", ["user_id"], name: "index_lines_on_user_id"

  create_table "makes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "makes", ["user_id"], name: "index_makes_on_user_id"

  create_table "models", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "make_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "models", ["make_id"], name: "index_models_on_make_id"
  add_index "models", ["user_id"], name: "index_models_on_user_id"

  create_table "odometers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "contract_id"
    t.date     "odometer_date"
    t.integer  "odometer_reading"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "odometers", ["contract_id"], name: "index_odometers_on_contract_id"
  add_index "odometers", ["user_id"], name: "index_odometers_on_user_id"

  create_table "owners", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "mobile"
    t.string   "email"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "legal_entity"
    t.string   "id_number"
    t.string   "registered_name"
    t.string   "trading_name"
    t.string   "registration_number"
    t.string   "residential_address1"
    t.string   "residential_address2"
    t.string   "suburb"
    t.string   "city"
    t.string   "province"
    t.string   "landline"
    t.string   "service_required"
    t.string   "agent"
    t.decimal  "rebate_rate"
    t.string   "vat_number"
    t.string   "bank"
    t.string   "type_of_account"
    t.string   "branch_code"
    t.string   "account_number"
    t.string   "contact_name"
    t.string   "contact_surname"
    t.string   "contact_telephone_number"
    t.string   "contact_email_address"
  end

  add_index "owners", ["user_id"], name: "index_owners_on_user_id"

  create_table "renters", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "status"
    t.string   "name"
    t.string   "surname"
    t.string   "id_number"
    t.string   "email"
    t.string   "drivers_licence"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "residential_address1"
    t.string   "residential_address2"
    t.string   "suburb"
    t.string   "city"
    t.string   "province"
    t.string   "landline"
    t.date     "date_drivers_licence_expires"
    t.string   "payment_method"
    t.boolean  "consent_to_credit_check"
    t.integer  "net_monthly_household_income"
    t.integer  "max_rental_approved"
    t.boolean  "clean_credit_record"
  end

  add_index "renters", ["user_id"], name: "index_renters_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
