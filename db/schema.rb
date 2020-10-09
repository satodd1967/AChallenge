# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_05_212703) do

  create_table "challenge_goals", force: :cascade do |t|
    t.float "start_weight"
    t.float "start_body_fat"
    t.integer "start_calorie_goal"
    t.integer "user_id", null: false
    t.integer "challenge_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["challenge_id"], name: "index_challenge_goals_on_challenge_id"
    t.index ["user_id"], name: "index_challenge_goals_on_user_id"
  end

  create_table "challenge_users", force: :cascade do |t|
    t.integer "challenge_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["challenge_id"], name: "index_challenge_users_on_challenge_id"
    t.index ["user_id"], name: "index_challenge_users_on_user_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "start_date"
    t.integer "duration"
    t.string "end_date"
    t.integer "active_calorie_goal"
    t.integer "points_worked_out"
    t.integer "points_tracked_food"
    t.integer "points_met_calorie_goal"
    t.integer "points_maintain_weight"
    t.integer "points_maintain_body_fat"
    t.integer "points_met_active_calorie_goal"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_challenges_on_user_id"
  end

  create_table "logs", force: :cascade do |t|
    t.string "log_date"
    t.boolean "worked_out"
    t.boolean "tracked_food"
    t.float "weight"
    t.float "body_fat"
    t.integer "active_calories"
    t.integer "calories"
    t.integer "points_worked_out"
    t.integer "points_tracked_food"
    t.integer "points_met_calorie_goal"
    t.integer "points_maintain_weight"
    t.integer "points_maintain_body_fat"
    t.integer "points_met_active_calorie_goal"
    t.integer "total_points"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "challenge_goals", "challenges"
  add_foreign_key "challenge_goals", "users"
  add_foreign_key "challenge_users", "challenges"
  add_foreign_key "challenge_users", "users"
  add_foreign_key "challenges", "users"
  add_foreign_key "logs", "users"
end
