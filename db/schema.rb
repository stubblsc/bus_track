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

ActiveRecord::Schema.define(version: 20140513215255) do

  create_table "drivers", force: true do |t|
    t.string   "name"
    t.integer  "currentBusID"
    t.integer  "currentRouteID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frequencies", force: true do |t|
    t.integer  "route_id"
    t.boolean  "mon"
    t.boolean  "tues"
    t.boolean  "wed"
    t.boolean  "thur"
    t.boolean  "fri"
    t.boolean  "sat"
    t.boolean  "sun"
    t.time     "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "start_time"
    t.time     "end_time"
  end

  create_table "mileages", force: true do |t|
    t.integer  "busId"
    t.integer  "driverId"
    t.string   "reason"
    t.integer  "startMileage"
    t.integer  "endMileage"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "garage_out"
    t.integer  "garage_in"
  end

  create_table "riders", force: true do |t|
    t.integer  "routeID"
    t.integer  "stopID"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "studentCount"
    t.integer  "cashCount"
    t.integer  "halfCount"
  end

  create_table "routes", force: true do |t|
    t.string   "name"
    t.string   "longname"
    t.string   "color"
    t.text     "shape",      limit: 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enabled"
  end

  create_table "stops", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "latitude",    precision: 10, scale: 6
    t.decimal  "longitude",   precision: 10, scale: 6
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phonetic"
  end

  create_table "trips", force: true do |t|
    t.integer  "route_id"
    t.integer  "order"
    t.integer  "first_stop_id"
    t.integer  "second_stop_id"
    t.text     "polyline"
    t.decimal  "distance",       precision: 10, scale: 6
    t.integer  "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "vehicle_locations", force: true do |t|
    t.integer  "vehicle_id"
    t.integer  "route_id"
    t.decimal  "latitude",   precision: 10, scale: 6
    t.decimal  "longitude",  precision: 10, scale: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicles", force: true do |t|
    t.integer  "busId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
