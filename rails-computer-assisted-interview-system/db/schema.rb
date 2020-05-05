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

ActiveRecord::Schema.define(version: 20200503063010) do

  create_table "options", force: :cascade do |t|
    t.integer  "qstep_id"
    t.integer  "qstep2_id"
    t.string   "noticestr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "options", ["qstep2_id"], name: "index_options_on_qstep2_id"
  add_index "options", ["qstep_id"], name: "index_options_on_qstep_id"

  create_table "optrecords", force: :cascade do |t|
    t.integer  "qnaire_id"
    t.integer  "qstep_id"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "optrecords", ["qnaire_id"], name: "index_optrecords_on_qnaire_id"
  add_index "optrecords", ["qstep_id"], name: "index_optrecords_on_qstep_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "false"
    t.datetime ""
    t.datetime "entry_time"
    t.string   "sql_link"
    t.integer  "qformat_id"
  end

  create_table "qanswers", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "count"
  end

  add_index "qanswers", ["question_id"], name: "index_qanswers_on_question_id"

  create_table "qformats", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "startstep_id"
  end

  add_index "qformats", ["startstep_id"], name: "index_qformats_on_startstep_id"

  create_table "qnaires", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "qformat_id"
    t.integer  "current_id"
    t.integer  "status"
    t.integer  "user_id"
  end

  add_index "qnaires", ["current_id"], name: "index_qnaires_on_current_id"
  add_index "qnaires", ["qformat_id"], name: "index_qnaires_on_qformat_id"

  create_table "qstates", force: :cascade do |t|
    t.string  "answer"
    t.integer "qnaire_id"
    t.integer "qstep_id"
  end

  add_index "qstates", ["qnaire_id"], name: "index_qstates_on_qnaire_id"
  add_index "qstates", ["qstep_id"], name: "index_qstates_on_qstep_id"

  create_table "qsteps", force: :cascade do |t|
    t.string   "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.integer  "qformat_id"
    t.integer  "kind"
  end

  add_index "qsteps", ["qformat_id"], name: "index_qsteps_on_qformat_id"

  create_table "qsteps_qsteps", force: :cascade do |t|
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "step_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["step_id"], name: "index_questions_on_step_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "role"
    t.integer  "project_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["project_id"], name: "index_users_on_project_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
