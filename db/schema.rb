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

ActiveRecord::Schema.define(version: 2020_02_03_120016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "draw_participants", force: :cascade do |t|
    t.bigint "draw_id"
    t.bigint "user_ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["draw_id", "user_ticket_id"], name: "index_draw_participants_on_draw_id_and_user_ticket_id", unique: true
    t.index ["draw_id"], name: "index_draw_participants_on_draw_id"
    t.index ["user_ticket_id"], name: "index_draw_participants_on_user_ticket_id"
  end

  create_table "draws", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "ticket_id"
    t.integer "winner_user_ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_draws_on_ticket_id"
    t.index ["title"], name: "index_draws_on_title", unique: true
    t.index ["winner_user_ticket_id"], name: "index_draws_on_winner_user_ticket_id", unique: true
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title", null: false
    t.decimal "winning_amount", precision: 10, scale: 2, null: false
    t.index ["title"], name: "index_tickets_on_title", unique: true
  end

  create_table "user_tickets", force: :cascade do |t|
    t.bigint "ticket_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_user_tickets_on_ticket_id"
    t.index ["user_id"], name: "index_user_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "draw_participants", "draws"
  add_foreign_key "draw_participants", "user_tickets"
  add_foreign_key "draws", "tickets"
  add_foreign_key "draws", "user_tickets", column: "winner_user_ticket_id"
  add_foreign_key "user_tickets", "tickets"
  add_foreign_key "user_tickets", "users"
end
