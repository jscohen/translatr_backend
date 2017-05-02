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

ActiveRecord::Schema.define(version: 20170502145009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string   "name"
    t.integer  "song_id"
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["artist_id"], name: "index_albums_on_artist_id", using: :btree
    t.index ["song_id"], name: "index_albums_on_song_id", using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text   "content"
  end

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.string   "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_artists_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "examples", force: :cascade do |t|
    t.text     "text",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_examples_on_user_id", using: :btree
  end

  create_table "lyrics", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "song_id"
    t.string   "text"
    t.string   "title"
    t.string   "artist"
    t.string   "translation"
    t.index ["song_id"], name: "index_lyrics_on_song_id", using: :btree
  end

  create_table "songs", force: :cascade do |t|
    t.string   "name"
    t.string   "album"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "artist_id"
    t.integer  "user_id"
    t.integer  "album_id"
    t.index ["album_id"], name: "index_songs_on_album_id", using: :btree
    t.index ["artist_id"], name: "index_songs_on_artist_id", using: :btree
    t.index ["user_id"], name: "index_songs_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "token",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "album_id"
    t.index ["album_id"], name: "index_users_on_album_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["token"], name: "index_users_on_token", unique: true, using: :btree
  end

  add_foreign_key "albums", "artists"
  add_foreign_key "albums", "songs"
  add_foreign_key "albums", "users", name: "albums_user_id_fkey"
  add_foreign_key "artists", "users"
  add_foreign_key "examples", "users"
  add_foreign_key "lyrics", "songs"
  add_foreign_key "songs", "albums"
  add_foreign_key "songs", "artists"
  add_foreign_key "songs", "users"
  add_foreign_key "users", "albums"
end
