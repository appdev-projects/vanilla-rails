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

ActiveRecord::Schema.define(version: 2022_05_28_141208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "commentor_id", null: false
    t.bigint "game_id", null: false
    t.string "commentroom", default: "general"
    t.text "commenttext"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentor_id"], name: "index_comments_on_commentor_id"
    t.index ["game_id"], name: "index_comments_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "status"
    t.string "whiteteamcolor"
    t.string "blackteamcolor"
    t.string "outcome"
    t.string "moves"
    t.string "boardsetup"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "moves", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.string "move"
    t.boolean "legal"
    t.boolean "accepted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_moves_on_game_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.bigint "pieceowner_id", null: false
    t.string "teamcolor"
    t.string "piecetype"
    t.integer "points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pieceowner_id"], name: "index_pieces_on_pieceowner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.integer "points", default: 0
    t.integer "wins", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "voter_id", null: false
    t.bigint "move_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["move_id"], name: "index_votes_on_move_id"
    t.index ["voter_id"], name: "index_votes_on_voter_id"
  end

  add_foreign_key "comments", "games"
  add_foreign_key "comments", "users", column: "commentor_id"
  add_foreign_key "moves", "games"
  add_foreign_key "pieces", "users", column: "pieceowner_id"
  add_foreign_key "votes", "moves"
  add_foreign_key "votes", "users", column: "voter_id"
end
