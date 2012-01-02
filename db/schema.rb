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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120101212503) do

  create_table "comments", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "url"
    t.boolean  "deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "evaluations", :force => true do |t|
    t.integer  "company_id"
    t.integer  "age"
    t.integer  "position"
    t.integer  "post"
    t.integer  "income"
    t.integer  "working_hours"
    t.integer  "holiday_days"
    t.integer  "overtime_pay"
    t.integer  "illegality"
    t.integer  "interview_attitude"
    t.integer  "resume"
    t.integer  "stress_interview"
    t.integer  "sexual_harassment"
    t.integer  "interviewer_count"
    t.integer  "promise"
    t.string   "question1"
    t.string   "question2"
    t.string   "question3"
    t.integer  "job_type"
    t.integer  "enjoyment"
    t.integer  "learn"
    t.boolean  "deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

end
