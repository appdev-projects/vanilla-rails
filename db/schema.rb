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

ActiveRecord::Schema.define(version: 2023_06_26_180635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "plpgsql"

  create_table "assessment_questions", force: :cascade do |t|
    t.string "name"
    t.string "question"
    t.string "spiritual_type"
    t.integer "number"
    t.string "assessment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "course_id"
    t.integer "lesson_id"
  end

  create_table "assessment_scores", force: :cascade do |t|
    t.integer "seeker_id"
    t.float "personalist", default: 0.0
    t.float "communalist", default: 0.0
    t.float "environmentalist", default: 0.0
    t.float "transcendentalist", default: 0.0
    t.string "spiritual_type", default: "not_set"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "divine_relationship", default: 0.0
    t.float "something_more", default: 0.0
    t.float "creator_relationship", default: 0.0
    t.float "love_others", default: 0.0
    t.float "chain_link", default: 0.0
    t.float "authentic_vulnerable", default: 0.0
    t.float "nature_oneness", default: 0.0
    t.float "magic_vibrations", default: 0.0
    t.float "environment_harmony", default: 0.0
    t.float "inner_peace", default: 0.0
    t.float "self_knowing", default: 0.0
    t.float "inner_resources", default: 0.0
    t.float "divine_relationship_lived"
    t.float "something_more_lived"
    t.float "creator_relationship_lived"
    t.float "love_others_lived"
    t.float "chain_link_lived"
    t.float "authentic_vulnerable_lived"
    t.float "nature_oneness_lived"
    t.float "magic_vibrations_lived"
    t.float "environment_harmony_lived"
    t.float "inner_peace_lived"
    t.float "self_knowing_lived"
    t.float "inner_resources_lived"
  end

  create_table "courses", force: :cascade do |t|
    t.string "spiritual_type"
    t.string "title"
    t.string "short_description"
    t.integer "lessons_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lesson_events", force: :cascade do |t|
    t.integer "seeker_id"
    t.integer "lesson_id"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.integer "course_id"
    t.integer "day"
    t.string "title"
    t.string "description"
    t.integer "learning_session_id"
    t.integer "practice_session_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "spiritual_type"
    t.string "practice_description"
  end

  create_table "seekers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "active_course_id", default: 1
    t.integer "active_lesson_id", default: 1
    t.index ["email"], name: "index_seekers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_seekers_on_reset_password_token", unique: true
  end

end
