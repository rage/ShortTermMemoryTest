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

ActiveRecord::Schema.define(version: 20140616105418) do

  create_table "admins", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "lists", force: true do |t|
    t.string   "filename"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "training"
    t.boolean  "active"
  end

  create_table "numbers", force: true do |t|
    t.integer  "numberset_id"
    t.integer  "position"
    t.integer  "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "numbersets", force: true do |t|
    t.integer  "position"
    t.integer  "list_id"
    t.integer  "length"
    t.string   "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: true do |t|
    t.string   "keypressed"
    t.integer  "keypressindex"
    t.integer  "last_series"
    t.integer  "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "testcase_id"
  end

  create_table "testcases", force: true do |t|
    t.integer  "user_id"
    t.integer  "list_id"
    t.boolean  "training"
    t.boolean  "finished"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "testlogs", force: true do |t|
    t.integer  "testcase_id"
    t.string   "eventtype"
    t.string   "value"
    t.integer  "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "sex"
    t.integer  "yearOfBirth"
    t.string   "handedness"
    t.string   "education"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
