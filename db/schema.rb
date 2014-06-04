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

ActiveRecord::Schema.define(version: 20140604110457) do

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
