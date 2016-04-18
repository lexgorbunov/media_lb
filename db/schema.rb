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

ActiveRecord::Schema.define(version: 20160416090553) do

  create_table "galleries", force: :cascade do |t|
    t.string   "title"
    t.boolean  "is_published", default: false, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "media_files", force: :cascade do |t|
    t.integer  "media_file_id",     null: false
    t.string   "class_name",        null: false
    t.string   "file_file_path"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.string   "file_file_size"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "gallery_id", null: false
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end