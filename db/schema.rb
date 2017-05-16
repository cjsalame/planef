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

ActiveRecord::Schema.define(version: 20170516145649) do

  create_table "expected_learnings", force: :cascade do |t|
    t.string "code"
    t.string "grade"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades_subjects_teachers", force: :cascade do |t|
    t.integer "grade_id"
    t.integer "subjects_teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grade_id"], name: "index_grades_subjects_teachers_on_grade_id"
    t.index ["subjects_teacher_id"], name: "index_grades_subjects_teachers_on_subjects_teacher_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.text "objectives"
    t.text "starting"
    t.text "developing"
    t.text "finalizing"
    t.text "content"
    t.text "resources"
    t.text "duration"
    t.text "evaluation"
    t.integer "planification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "expected_learning_id"
    t.index ["expected_learning_id"], name: "index_lectures_on_expected_learning_id"
    t.index ["planification_id"], name: "index_lectures_on_planification_id"
  end

  create_table "planifications", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.integer "rating"
    t.integer "downloads"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lecture_id"
    t.index ["lecture_id"], name: "index_planifications_on_lecture_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "RBD"
    t.string "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "schools_users", id: false, force: :cascade do |t|
    t.integer "school_id", null: false
    t.integer "user_id", null: false
    t.index ["school_id", "user_id"], name: "index_schools_users_on_school_id_and_user_id"
    t.index ["user_id", "school_id"], name: "index_schools_users_on_user_id_and_school_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects_teachers", force: :cascade do |t|
    t.integer "subject_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_subjects_teachers_on_subject_id"
    t.index ["user_id"], name: "index_subjects_teachers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.date "dob"
    t.string "phone"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
