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

ActiveRecord::Schema.define(:version => 20130405152542) do

  create_table "answers", :force => true do |t|
    t.string   "name"
    t.boolean  "is_correct"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "prompt"
    t.integer  "quiz_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "quizzes", :force => true do |t|
    t.string  "name"
    t.boolean "is_public"
    t.decimal "cost",      :default => 0.0
    t.string  "code"
    t.integer "num_pass"
    t.integer "user_id"
  end

  create_table "quizzes_tags", :id => false, :force => true do |t|
    t.integer "quiz_id"
    t.integer "tag_id"
  end

  create_table "results", :force => true do |t|
    t.integer  "user_id"
    t.integer  "quiz_id"
    t.integer  "num_correct"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "has_started", :default => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "address"
    t.string   "phone"
    t.string   "image"
    t.string   "occupation"
    t.float    "lat"
    t.float    "long"
    t.decimal  "balance"
    t.boolean  "is_house"
    t.string   "customer_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
