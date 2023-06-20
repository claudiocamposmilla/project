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

ActiveRecord::Schema[7.0].define(version: 2023_06_19_034706) do
  create_table "resolutions", force: :cascade do |t|
    t.integer "ticket_id", null: false
    t.integer "resolved", default: 1
    t.integer "evaluation"
    t.string "resolution_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_body"
    t.index ["ticket_id"], name: "index_resolutions_on_ticket_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.date "claim_date"
    t.date "due_date"
    t.date "incident_date"
    t.string "summary"
    t.string "description"
    t.integer "priority", default: 1
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tags"
  end

  create_table "user_comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "ticket_id", null: false
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_user_comments_on_ticket_id"
    t.index ["user_id"], name: "index_user_comments_on_user_id"
  end

  create_table "user_resolutions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "resolution_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resolution_id"], name: "index_user_resolutions_on_resolution_id"
    t.index ["user_id"], name: "index_user_resolutions_on_user_id"
  end

  create_table "user_tickets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "ticket_id", null: false
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
    t.integer "profile", default: 0, null: false
    t.string "name", null: false
    t.string "lastname", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "resolutions", "tickets"
  add_foreign_key "user_comments", "tickets"
  add_foreign_key "user_comments", "users"
  add_foreign_key "user_resolutions", "resolutions"
  add_foreign_key "user_resolutions", "users"
  add_foreign_key "user_tickets", "tickets"
  add_foreign_key "user_tickets", "users"
end
