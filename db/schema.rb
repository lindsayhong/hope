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

ActiveRecord::Schema.define(version: 20131109212224) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "er_visits", force: true do |t|
    t.integer  "intervention_id"
    t.date     "er_date"
    t.string   "er_icd9_code"
    t.string   "er_icd9_detail"
    t.integer  "er_cost"
    t.text     "er_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hospital_visits", force: true do |t|
    t.date     "admission_date"
    t.date     "discharge_date"
    t.string   "icd9_code"
    t.text     "icd9_detail"
    t.decimal  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "intervention_id"
    t.integer  "hospital_visit_duration"
  end

  create_table "interventions", force: true do |t|
    t.date     "intervention_start_date"
    t.date     "intervention_end_date"
    t.string   "outcome"
    t.string   "nurse"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recruitment_id"
  end

  create_table "recruitments", force: true do |t|
    t.integer  "recruit_id"
    t.date     "review_date"
    t.string   "account_number"
    t.date     "admission_date"
    t.integer  "past_er_visits"
    t.integer  "past_hosp_visits"
    t.text     "reason_admitted"
    t.integer  "recruitment_age"
    t.integer  "eject_frac"
    t.decimal  "serum_albumin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "group"
  end

  create_table "recruits", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "medical_record_number"
    t.date     "date_of_birth"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "middle_initial"
    t.string   "sex"
    t.boolean  "participant"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
