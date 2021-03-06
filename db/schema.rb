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

ActiveRecord::Schema.define(:version => 20130618094857) do

  create_table "accounts", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "username"
    t.string   "uid"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "oauth_token"
    t.string   "oauth_token_secret"
    t.string   "oauth_verifier"
  end

  create_table "fb_posts", :force => true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.datetime "post_time"
    t.boolean  "is_posted"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "linkedins", :force => true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.datetime "post_time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "is_shared"
  end

  create_table "messages", :force => true do |t|
    t.string   "shared_on"
    t.string   "msg_text"
    t.string   "msg_type"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tweets", :force => true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.datetime "post_time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "is_tweeted"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "token"
    t.string   "username"
  end

  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
