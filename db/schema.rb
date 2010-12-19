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

ActiveRecord::Schema.define(:version => 0) do

  create_table "aspect_memberships", :force => true do |t|
    t.boolean  "pending",    :default => true
    t.integer  "aspect_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "aspect_memberships", ["aspect_id", "person_id"], :name => "index_aspect_memberships_on_aspect_id_and_person_id", :unique => true
  add_index "aspect_memberships", ["aspect_id"], :name => "index_aspect_memberships_on_aspect_id"

  create_table "aspects", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "aspects", ["user_id"], :name => "index_aspects_on_user_id"

  create_table "aspects_posts", :id => false, :force => true do |t|
    t.integer  "aspect_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "aspects_posts", ["aspect_id"], :name => "index_aspects_posts_on_aspect_id"
  add_index "aspects_posts", ["post_id"], :name => "index_aspects_posts_on_post_id"

  create_table "comments", :force => true do |t|
    t.text     "text"
    t.integer  "post_id"
    t.integer  "person_id"
    t.string   "guid"
    t.text     "creator_signature"
    t.text     "post_creator_signature"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["guid"], :name => "index_comments_on_guid", :unique => true
  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"

  create_table "invitations", :force => true do |t|
    t.text     "message"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.integer  "aspect_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitations", ["sender_id"], :name => "index_invitations_on_sender_id"

  create_table "notifications", :force => true do |t|
    t.string   "target_type"
    t.integer  "target_id"
    t.integer  "receiver_id"
    t.integer  "actor_id"
    t.string   "action"
    t.boolean  "unread",      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["target_type", "target_id"], :name => "index_notifications_on_target_type_and_target_id"

  create_table "people", :force => true do |t|
    t.string   "guid"
    t.text     "url"
    t.string   "diaspora_handle"
    t.text     "serialized_public_key"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["diaspora_handle"], :name => "index_people_on_diaspora_handle", :unique => true
  add_index "people", ["guid"], :name => "index_people_on_guid", :unique => true
  add_index "people", ["owner_id"], :name => "index_people_on_owner_id", :unique => true

  create_table "posts", :force => true do |t|
    t.boolean  "public",            :default => false
    t.string   "diaspora_handle"
    t.boolean  "pending"
    t.integer  "user_refs"
    t.string   "type"
    t.text     "message"
    t.integer  "status_message_id"
    t.text     "caption"
    t.text     "remote_photo_path"
    t.string   "remote_photo_name"
    t.string   "random_string"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["type"], :name => "index_posts_on_type"

  create_table "profiles", :force => true do |t|
    t.string   "diaspora_handle"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image_url"
    t.string   "image_url_small"
    t.string   "image_url_medium"
    t.date     "birthday"
    t.string   "gender"
    t.text     "bio"
    t.boolean  "searchable",       :default => true
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["first_name", "last_name", "searchable"], :name => "index_profiles_on_first_name_and_last_name_and_searchable"
  add_index "profiles", ["first_name", "searchable"], :name => "index_profiles_on_first_name_and_searchable"
  add_index "profiles", ["last_name", "searchable"], :name => "index_profiles_on_last_name_and_searchable"
  add_index "profiles", ["person_id"], :name => "index_profiles_on_person_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.text     "serialized_private_key"
    t.integer  "invites"
    t.boolean  "getting_started",                       :default => true
    t.boolean  "disable_mail",                          :default => false
    t.string   "language"
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                         :default => "",    :null => false
    t.string   "invitation_token",       :limit => 20
    t.datetime "invitation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
