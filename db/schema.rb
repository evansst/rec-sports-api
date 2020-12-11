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

ActiveRecord::Schema.define(version: 2020_09_11_060854) do

  create_table "games", force: :cascade do |t|
    t.integer "home_team", null: false
    t.integer "away_team", null: false
    t.integer "home_team_score"
    t.integer "away_team_score"
    t.integer "season_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["season_id"], name: "index_games_on_season_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "league_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "participates_ins", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "team_game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_participates_ins_on_player_id"
    t.index ["team_game_id"], name: "index_participates_ins_on_team_game_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.string "email_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "gender"
  end

  create_table "plays_fors", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_plays_fors_on_player_id"
    t.index ["team_id"], name: "index_plays_fors_on_team_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "start_date"
    t.string "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "league_id", null: false
    t.index ["league_id"], name: "index_seasons_on_league_id"
  end

  create_table "standings", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "season_id", null: false
    t.integer "points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["season_id"], name: "index_standings_on_season_id"
    t.index ["team_id"], name: "index_standings_on_team_id"
  end

  create_table "team_games", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_team_games_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "color"
  end

  add_foreign_key "games", "seasons"
  add_foreign_key "participates_ins", "players"
  add_foreign_key "participates_ins", "team_games"
  add_foreign_key "plays_fors", "players"
  add_foreign_key "plays_fors", "teams"
  add_foreign_key "seasons", "leagues"
  add_foreign_key "standings", "seasons"
  add_foreign_key "standings", "teams"
  add_foreign_key "team_games", "teams"
end
