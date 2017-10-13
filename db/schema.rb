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

ActiveRecord::Schema.define(version: 20171013101524) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "end_date"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_nominees", force: :cascade do |t|
    t.integer "category_id"
    t.integer "nominee_id"
  end

  create_table "nominees", force: :cascade do |t|
    t.string "name"
    t.integer "votes", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.index ["cached_votes_down"], name: "index_nominees_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_nominees_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_nominees_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_nominees_on_cached_votes_up"
    t.index ["cached_weighted_average"], name: "index_nominees_on_cached_weighted_average"
    t.index ["cached_weighted_score"], name: "index_nominees_on_cached_weighted_score"
    t.index ["cached_weighted_total"], name: "index_nominees_on_cached_weighted_total"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.integer "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "votes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "nominee_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_votes_on_category_id"
    t.index ["nominee_id"], name: "index_votes_on_nominee_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

end