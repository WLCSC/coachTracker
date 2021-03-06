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

ActiveRecord::Schema.define(version: 13) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "pay"
  end

  create_table "certifications", force: :cascade do |t|
    t.integer  "course_id",  null: false
    t.integer  "year_id",    null: false
    t.integer  "person_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "certifications", ["course_id"], name: "index_certifications_on_course_id", using: :btree
  add_index "certifications", ["person_id"], name: "index_certifications_on_person_id", using: :btree
  add_index "certifications", ["year_id"], name: "index_certifications_on_year_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "courses", ["name"], name: "index_courses_on_name", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "people", ["name"], name: "index_people_on_name", using: :btree

  create_table "positions", force: :cascade do |t|
    t.date     "hire"
    t.integer  "experience",                 null: false
    t.float    "fte",                        null: false
    t.integer  "role_id",                    null: false
    t.integer  "person_id",                  null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "reported",   default: false, null: false
  end

  add_index "positions", ["person_id"], name: "index_positions_on_person_id", using: :btree
  add_index "positions", ["role_id"], name: "index_positions_on_role_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "category_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "sport_id",    null: false
    t.integer  "fte",         null: false
  end

  add_index "roles", ["category_id"], name: "index_roles_on_category_id", using: :btree
  add_index "roles", ["sport_id"], name: "index_roles_on_sport_id", using: :btree

  create_table "sports", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "short",                     null: false
    t.date     "start_date",                null: false
    t.date     "end_date",                  null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "certified",  default: true, null: false
  end

  create_table "years", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "certifications", "courses"
  add_foreign_key "certifications", "people"
  add_foreign_key "certifications", "years"
  add_foreign_key "positions", "people"
  add_foreign_key "positions", "roles"
  add_foreign_key "roles", "categories"
  add_foreign_key "roles", "sports"
end
