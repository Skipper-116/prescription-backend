# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_02_10_190830) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "dosages", force: :cascade do |t|
    t.bigint "medication_id", null: false
    t.bigint "frequency_type_id", null: false
    t.float "amount"
    t.string "unit"
    t.integer "default_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["frequency_type_id"], name: "index_dosages_on_frequency_type_id"
    t.index ["medication_id"], name: "index_dosages_on_medication_id"
  end

  create_table "frequency_types", force: :cascade do |t|
    t.string "name", null: false
    t.float "multiplier", null: false
    t.boolean "voided", default: false
    t.date "voided_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.boolean "voided", default: false
    t.date "voided_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "unit_price"
  end

  create_table "prescription_dosages", force: :cascade do |t|
    t.bigint "dosage_id", null: false
    t.integer "duration"
    t.boolean "voided"
    t.date "voded_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "prescription_id", null: false
    t.index ["dosage_id"], name: "index_prescription_dosages_on_dosage_id"
    t.index ["prescription_id"], name: "index_prescription_dosages_on_prescription_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.float "amount"
    t.boolean "voided"
    t.date "voided_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dosages", "frequency_types"
  add_foreign_key "dosages", "medications"
  add_foreign_key "prescription_dosages", "dosages"
  add_foreign_key "prescription_dosages", "prescriptions"
end
