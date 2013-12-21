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

ActiveRecord::Schema.define(version: 20131220090411) do

  create_table "course_textbooks", force: true do |t|
    t.integer  "course_id"
    t.integer  "textbook_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_textbooks", ["course_id"], name: "index_course_textbooks_on_course_id"
  add_index "course_textbooks", ["textbook_id"], name: "index_course_textbooks_on_textbook_id"

  create_table "courses", force: true do |t|
    t.string   "title"
    t.string   "letters"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professor_courses", force: true do |t|
    t.integer  "professor_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "professor_courses", ["course_id"], name: "index_professor_courses_on_course_id"
  add_index "professor_courses", ["professor_id"], name: "index_professor_courses_on_professor_id"

  create_table "professors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "department"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: true do |t|
    t.string   "content"
    t.integer  "vote_id"
    t.integer  "student_id"
    t.integer  "course_textbook_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["course_textbook_id"], name: "index_ratings_on_course_textbook_id"
  add_index "ratings", ["student_id"], name: "index_ratings_on_student_id"
  add_index "ratings", ["vote_id"], name: "index_ratings_on_vote_id"

  create_table "student_courses", force: true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_courses", ["course_id"], name: "index_student_courses_on_course_id"
  add_index "student_courses", ["student_id"], name: "index_student_courses_on_student_id"

  create_table "students", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.date     "year"
    t.boolean  "verified"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "textbooks", force: true do |t|
    t.string   "title"
    t.string   "authors"
    t.string   "edition"
    t.float    "price"
    t.string   "isbn"
    t.text     "description"
    t.string   "image_url"
    t.date     "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.string "method"
  end

end
