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

ActiveRecord::Schema.define(version: 20131009054343) do

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
  end

  create_table "interventions", force: true do |t|
    t.string   "group"
    t.date     "intervention_start_date"
    t.date     "intervention_end_date"
    t.string   "outcome"
    t.string   "nurse"
    t.integer  "previous_hospitalizations"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "participant_id"
  end

  create_table "participants", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "medical_record_number"
    t.date     "date_of_birth"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "middle_initial"
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
