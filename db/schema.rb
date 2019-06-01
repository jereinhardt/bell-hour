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

ActiveRecord::Schema.define(version: 2019_06_01_035638) do

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.integer "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "grade"
    t.index ["school_id"], name: "index_departments_on_school_id"
  end

  create_table "guardian_relations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_guardian_relations_on_student_id"
    t.index ["user_id"], name: "index_guardian_relations_on_user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.string "transportation_type"
    t.boolean "present"
    t.string "photo"
    t.integer "teacher_id"
    t.integer "guardian_id"
    t.integer "with_teacher_id"
  end

  create_table "teacher_relations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_teacher_relations_on_student_id"
    t.index ["user_id"], name: "index_teacher_relations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.boolean "teacher"
    t.boolean "guardian"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.integer "department_id"
    t.string "teacher_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "with_teacher_relations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_with_teacher_relations_on_student_id"
    t.index ["user_id"], name: "index_with_teacher_relations_on_user_id"
  end

end
