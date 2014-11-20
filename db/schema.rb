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

ActiveRecord::Schema.define(version: 20141120060558) do

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
    t.string   "status"
  end

  create_table "ratings", force: true do |t|
    t.string   "content"
    t.integer  "vote_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "textbook_association_id"
  end

  add_index "ratings", ["student_id"], name: "index_ratings_on_student_id"
  add_index "ratings", ["textbook_association_id"], name: "index_ratings_on_textbook_association_id"
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
    t.string   "email",                  default: "",    null: false
    t.integer  "year"
    t.boolean  "admin",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "students", ["confirmation_token"], name: "index_students_on_confirmation_token", unique: true
  add_index "students", ["email"], name: "index_students_on_email", unique: true
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  add_index "students", ["unlock_token"], name: "index_students_on_unlock_token", unique: true

  create_table "textbook_associations", force: true do |t|
    t.integer  "course_id"
    t.integer  "textbook_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "professor_id"
  end

  add_index "textbook_associations", ["course_id"], name: "index_textbook_associations_on_course_id"
  add_index "textbook_associations", ["professor_id"], name: "index_textbook_associations_on_professor_id"
  add_index "textbook_associations", ["textbook_id"], name: "index_textbook_associations_on_textbook_id"

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
    t.boolean  "is_ebook",    default: false
    t.string   "g_link"
  end

  create_table "votes", force: true do |t|
    t.string "method"
  end

end
