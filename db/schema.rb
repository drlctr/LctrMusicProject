# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140518064336) do

  create_table "albums", force: true do |t|
    t.string   "album_title"
    t.string   "year"
    t.string   "genre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "protected"
    t.integer  "artist_id"
  end

  create_table "artists", force: true do |t|
    t.string   "name"
    t.string   "nationality"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instruments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "musicians", force: true do |t|
    t.string   "first_name"
    t.date     "born"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name"
  end

  create_table "songs", force: true do |t|
    t.string   "song_title"
    t.integer  "track"
    t.integer  "duration"
    t.string   "path"
    t.string   "filename"
    t.string   "composer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "album_id"
  end

end
