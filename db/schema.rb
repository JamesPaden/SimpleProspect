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

ActiveRecord::Schema.define(:version => 20130518133146) do

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "emails", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.datetime "send_time"
    t.boolean  "sent",         :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "recipient_id"
    t.integer  "open_count",   :default => 0
  end

  create_table "recipients", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "campaign_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "enabled",     :default => true
  end

  create_table "templates", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "delay"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "campaign_id"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "email_password"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "bcc"
    t.string   "name"
  end

end
