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

ActiveRecord::Schema.define(version: 20171215000725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "certificates", force: :cascade do |t|
    t.integer  "course_id"
    t.date     "mailing_date"
    t.integer  "prisoner_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["course_id"], name: "index_certificates_on_course_id", using: :btree
    t.index ["prisoner_id"], name: "index_certificates_on_prisoner_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "sub_courses",                              array: true
    t.boolean  "archived",    default: false
  end

  create_table "courses_prisoners", id: false, force: :cascade do |t|
    t.integer "course_id",   null: false
    t.integer "prisoner_id", null: false
    t.index ["course_id", "prisoner_id"], name: "index_courses_prisoners_on_course_id_and_prisoner_id", using: :btree
    t.index ["prisoner_id", "course_id"], name: "index_courses_prisoners_on_prisoner_id_and_course_id", using: :btree
  end

  create_table "courses_volunteers", id: false, force: :cascade do |t|
    t.integer "course_id",    null: false
    t.integer "volunteer_id", null: false
    t.index ["course_id", "volunteer_id"], name: "index_courses_volunteers_on_course_id_and_volunteer_id", using: :btree
    t.index ["volunteer_id", "course_id"], name: "index_courses_volunteers_on_volunteer_id_and_course_id", using: :btree
  end

  create_table "prisoners", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_1"
    t.string   "prison_id"
    t.date     "enrollment_date"
    t.string   "city"
    t.string   "state"
    t.string   "comments"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "zip"
    t.string   "address_2"
    t.boolean  "dictionary"
    t.date     "dictionary_sent"
    t.date     "waitlist_date"
  end

  create_table "reports", force: :cascade do |t|
    t.json     "query"
    t.string   "model"
    t.string   "title"
    t.json     "result_records"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "special",        default: false
  end

  create_table "units", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "prisoner_id"
    t.integer  "volunteer_id"
    t.date     "mailing_date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "scan"
    t.date     "return_date"
    t.string   "sub_course"
    t.string   "reader_scan"
    t.date     "reader_mailing_date"
    t.date     "reader_return_date"
    t.index ["course_id"], name: "index_units_on_course_id", using: :btree
    t.index ["prisoner_id"], name: "index_units_on_prisoner_id", using: :btree
    t.index ["volunteer_id"], name: "index_units_on_volunteer_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore   "vacation"
    t.string   "college"
    t.string   "comments"
    t.index ["vacation"], name: "index_volunteers_on_vacation", using: :gin
  end

  add_foreign_key "certificates", "courses"
  add_foreign_key "certificates", "prisoners"
  add_foreign_key "units", "courses"
  add_foreign_key "units", "prisoners"
  add_foreign_key "units", "volunteers"
end
