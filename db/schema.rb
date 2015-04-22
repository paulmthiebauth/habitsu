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

ActiveRecord::Schema.define(version: 20150422175050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dailyhabits", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "habit_id"
    t.integer  "point_value"
    t.datetime "completed_at"
    t.datetime "date"
    t.integer  "plan_id"
    t.integer  "streak_count", default: 0
  end

  create_table "dailyscores", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "date"
    t.string   "weekday"
    t.integer  "total_score"
  end

  create_table "habits", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "planhabits", force: :cascade do |t|
    t.integer "plan_id",  null: false
    t.integer "habit_id", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string "plan_name"
    t.string "author"
    t.string "author_info"
  end

  create_table "signups", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "plan_id", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "user_id",      null: false
    t.string   "name",         null: false
    t.string   "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "completed_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
