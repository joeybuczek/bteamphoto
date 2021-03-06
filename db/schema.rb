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

ActiveRecord::Schema.define(version: 20150819165515) do

  create_table "collections", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "genre"
  end

  create_table "images", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "genre"
    t.integer  "collection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["collection_id"], name: "index_images_on_collection_id"

  create_table "invitations", force: true do |t|
    t.string   "token"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitations", ["user_id"], name: "index_invitations_on_user_id"

  create_table "invoices", force: true do |t|
    t.string   "description"
    t.datetime "due_date"
    t.integer  "invoiceable_id"
    t.string   "invoiceable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "balance_cents"
    t.string   "balance_currency"
    t.decimal  "tax_rate"
    t.integer  "payment_cents"
  end

  add_index "invoices", ["invoiceable_id", "invoiceable_type"], name: "index_invoices_on_invoiceable_id_and_invoiceable_type"

  create_table "items", force: true do |t|
    t.string   "description"
    t.integer  "invoice_id"
    t.integer  "price_cents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["invoice_id"], name: "index_items_on_invoice_id"

  create_table "portraits", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.text     "notes"
    t.integer  "user_id"
    t.string   "genre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "portraits", ["user_id"], name: "index_portraits_on_user_id"

  create_table "reviews", force: true do |t|
    t.text     "body"
    t.string   "genre"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating"
  end

  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "tax_rates", force: true do |t|
    t.string   "county"
    t.decimal  "rate"
    t.boolean  "default_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "user_name"
    t.string   "client_name"
    t.string   "name_primary"
    t.string   "name_secondary"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip_code"
    t.string   "phone_home"
    t.string   "phone_cell"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "webgalleries", force: true do |t|
    t.string   "url"
    t.string   "genre"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  add_index "webgalleries", ["user_id"], name: "index_webgalleries_on_user_id"

  create_table "weddings", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.string   "bride"
    t.string   "groom"
    t.string   "location_getting_ready_bride"
    t.string   "location_getting_ready_groom"
    t.string   "location_ceremony"
    t.string   "location_reception"
    t.string   "location_formals"
    t.date     "date_wedding"
    t.time     "time_getting_ready"
    t.time     "time_ceremony"
    t.time     "time_receptions"
    t.time     "time_formals"
    t.time     "time_end"
    t.decimal  "balance",                      precision: 8, scale: 2
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weddings", ["user_id"], name: "index_weddings_on_user_id"

end
