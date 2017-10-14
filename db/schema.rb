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

ActiveRecord::Schema.define(version: 20171014093949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
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
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.boolean "admin"
    t.text "description"
    t.string "name", default: ""
    t.string "establishment_date"
    t.string "representative"
    t.string "employees"
    t.string "capital"
    t.string "business"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_images", force: :cascade do |t|
    t.string "file_name"
    t.integer "order"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_images_on_company_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "recruit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recruit_id"], name: "index_favorites_on_recruit_id"
    t.index ["user_id", "recruit_id"], name: "index_favorites_on_user_id_and_recruit_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "recruit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recruit_id"], name: "index_job_applications_on_recruit_id"
    t.index ["user_id"], name: "index_job_applications_on_user_id"
  end

  create_table "recruit_images", force: :cascade do |t|
    t.string "file_name"
    t.integer "order"
    t.bigint "recruit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recruit_id"], name: "index_recruit_images_on_recruit_id"
  end

  create_table "recruits", force: :cascade do |t|
    t.bigint "company_id"
    t.string "occupation", null: false
    t.text "description", null: false
    t.text "qualification", null: false
    t.text "employment_type", null: false
    t.text "salary", null: false
    t.text "welfare", null: false
    t.text "office_hours", null: false
    t.text "holiday", null: false
    t.text "location", null: false
    t.text "consideration"
    t.text "information"
    t.text "screening_process"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_recruits_on_company_id"
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "first_name_kana", default: "", null: false
    t.string "last_name_kana", default: "", null: false
    t.integer "sex", default: -1, null: false
    t.date "birthday"
    t.string "phone_number"
    t.string "cell_phone_number"
    t.integer "employed_status"
    t.string "first_handicapped_part"
    t.string "first_handicapped_level"
    t.string "second_handicapped_part"
    t.string "second_handicapped_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "view_logs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "recruit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recruit_id"], name: "index_view_logs_on_recruit_id"
    t.index ["user_id"], name: "index_view_logs_on_user_id"
  end

end
