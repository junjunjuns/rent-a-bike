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

ActiveRecord::Schema.define(version: 20170415021133) do

  create_table "bikes", force: :cascade do |t|
    t.string   "name"
    t.string   "manufacturer"
    t.string   "color"
    t.decimal  "price"
    t.string   "description"
    t.string   "image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.integer  "age"
    t.string   "email"
    t.string   "phone"
    t.string   "profile_picture"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "rentals", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.decimal  "cost"
    t.string   "description"
    t.integer  "profile_id"
    t.integer  "bike_id"
  end

  add_index "rentals", ["bike_id"], name: "index_rentals_on_bike_id"
  add_index "rentals", ["profile_id"], name: "index_rentals_on_profile_id"

  create_table "reviews", force: :cascade do |t|
    t.string   "feedback"
    t.decimal  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "bike_id"
    t.integer  "profile_id"
  end

  add_index "reviews", ["bike_id"], name: "index_reviews_on_bike_id"
  add_index "reviews", ["profile_id"], name: "index_reviews_on_profile_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end