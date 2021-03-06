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

ActiveRecord::Schema.define(version: 20140324131956) do

  create_table "commits", force: true do |t|
    t.string   "sha"
    t.string   "url"
    t.string   "comments_url"
    t.integer  "author_id"
    t.integer  "commiter_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "commit_date"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "login"
    t.string   "avatar_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "github_id"
  end

end
