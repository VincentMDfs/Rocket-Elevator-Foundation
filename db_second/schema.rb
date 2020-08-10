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

ActiveRecord::Schema.define(version: 2020_07_15_004044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "DimCustomers", force: :cascade do |t|
    t.date "date_of_commisioning"
    t.string "company_name"
    t.string "full_name_company_contact"
    t.string "email_company_contact"
    t.integer "nb_elevator"
    t.string "customer_city"
  end

  create_table "FactContact", force: :cascade do |t|
    t.integer "contact_id"
    t.date "creation"
    t.string "company_name"
    t.string "email"
    t.string "project_name"
  end

  create_table "FactElevator", force: :cascade do |t|
    t.integer "serial_number"
    t.date "date_of_commisioning"
    t.integer "building_id"
    t.integer "customer_id"
    t.string "building_city"
  end

  create_table "FactQuotes", force: :cascade do |t|
    t.integer "quote_id"
    t.date "creation"
    t.string "company_name"
    t.string "email"
    t.integer "nb_elevator"
  end

end
