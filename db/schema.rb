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

ActiveRecord::Schema.define(version: 20180522111226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "gazelle_capability_logs", force: :cascade do |t|
    t.bigint "gazelle_runner_id"
    t.bigint "task_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gazelle_runner_id"], name: "index_gazelle_capability_logs_on_gazelle_runner_id"
    t.index ["task_category_id"], name: "index_gazelle_capability_logs_on_task_category_id"
  end

  create_table "gazelle_runners", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "description"
    t.index ["user_id"], name: "index_gazelle_runners_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_locations_on_company_id"
  end

  create_table "task_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "gazelle_runner_id"
    t.integer "cost_per_hour"
    t.integer "task_time"
    t.bigint "task_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "first_location_id"
    t.bigint "second_location_id"
    t.index ["company_id"], name: "index_tasks_on_company_id"
    t.index ["first_location_id"], name: "index_tasks_on_first_location_id"
    t.index ["gazelle_runner_id"], name: "index_tasks_on_gazelle_runner_id"
    t.index ["second_location_id"], name: "index_tasks_on_second_location_id"
    t.index ["task_category_id"], name: "index_tasks_on_task_category_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "companies", "users"
  add_foreign_key "gazelle_capability_logs", "gazelle_runners"
  add_foreign_key "gazelle_capability_logs", "task_categories"
  add_foreign_key "gazelle_runners", "users"
  add_foreign_key "locations", "companies"
  add_foreign_key "tasks", "companies"
  add_foreign_key "tasks", "gazelle_runners"
  add_foreign_key "tasks", "task_categories"
end
