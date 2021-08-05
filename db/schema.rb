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

ActiveRecord::Schema.define(version: 2021_08_04_081524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorizations", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.integer "user_id"
    t.string "token"
    t.string "secret"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment", null: false
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.bigint "users_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
    t.index ["users_id"], name: "index_comments_on_users_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "dislike", null: false
    t.integer "like", null: false
    t.float "rating", null: false
    t.bigint "users_id"
    t.bigint "ideas_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ideas_id"], name: "index_feedbacks_on_ideas_id"
    t.index ["users_id"], name: "index_feedbacks_on_users_id"
  end

  create_table "ideas", force: :cascade do |t|
    t.string "idea_name", limit: 225, null: false
    t.string "idea_description", null: false
    t.string "need", null: false
    t.string "geo", null: false
    t.string "problem", limit: 225, null: false
    t.string "industry", null: false
    t.boolean "visible", null: false
    t.bigint "teams_id"
    t.bigint "users_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teams_id"], name: "index_ideas_on_teams_id"
    t.index ["users_id"], name: "index_ideas_on_users_id"
  end

  create_table "roles", force: :cascade do |t|
    t.integer "role", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "industry", null: false
    t.string "geo", null: false
    t.string "opportunity", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "team_members", force: :cascade do |t|
    t.integer "team_role", null: false
    t.bigint "teams_id"
    t.bigint "users_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teams_id"], name: "index_team_members_on_teams_id"
    t.index ["users_id"], name: "index_team_members_on_users_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name", limit: 225, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", limit: 225, null: false
    t.string "last_name", limit: 225, null: false
    t.string "email", default: "", null: false
    t.bigint "role_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "comments", "users", column: "users_id"
  add_foreign_key "feedbacks", "ideas", column: "ideas_id"
  add_foreign_key "feedbacks", "users", column: "users_id"
  add_foreign_key "ideas", "teams", column: "teams_id"
  add_foreign_key "ideas", "users", column: "users_id"
  add_foreign_key "team_members", "teams", column: "teams_id"
  add_foreign_key "team_members", "users", column: "users_id"
  add_foreign_key "users", "roles"
end
