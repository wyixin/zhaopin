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

ActiveRecord::Schema.define(version: 20150624134116) do

  create_table "articles", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "text",        limit: 65535
    t.integer  "category_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree
  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "contact",    limit: 255
    t.string   "phone",      limit: 255
    t.string   "email",      limit: 255
    t.string   "web_site",   limit: 255
    t.string   "logo",       limit: 255
    t.string   "logo_audit", limit: 255
    t.string   "contents",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "company_id",      limit: 4
    t.string   "recommend",       limit: 255
    t.string   "sex",             limit: 255
    t.string   "amount",          limit: 255
    t.integer  "category_id",     limit: 4
    t.integer  "sub_category_id", limit: 4
    t.string   "education",       limit: 255
    t.string   "experience",      limit: 255
    t.string   "wage",            limit: 255
    t.date     "strat_time"
    t.date     "end_time"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "resume_attachments", force: :cascade do |t|
    t.integer  "resume_id",       limit: 4
    t.string   "attachment_file", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "resume_educations", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "school",     limit: 255
    t.string   "speciality", limit: 255
    t.string   "education",  limit: 255
    t.date     "start_time"
    t.date     "end_time"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "resume_works", force: :cascade do |t|
    t.integer  "resume_id",    limit: 4
    t.string   "company",      limit: 255
    t.string   "job",          limit: 255
    t.string   "wage",         limit: 255
    t.date     "start_time"
    t.date     "end_time"
    t.text     "achievements", limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "resumes", force: :cascade do |t|
    t.string   "status",           limit: 255
    t.integer  "user_id",          limit: 4
    t.string   "title",            limit: 255
    t.string   "fullname",         limit: 255
    t.string   "email",            limit: 255
    t.string   "phone",            limit: 255
    t.string   "sex",              limit: 255
    t.date     "birthday"
    t.string   "height",           limit: 255
    t.string   "marriage",         limit: 255
    t.string   "tag",              limit: 255
    t.string   "qq",               limit: 255
    t.string   "intention_jobs",   limit: 255
    t.string   "wage",             limit: 255
    t.string   "district",         limit: 255
    t.string   "photo_img",        limit: 255
    t.string   "photo_audit",      limit: 255
    t.string   "talent",           limit: 255
    t.string   "complete_percent", limit: 255
    t.integer  "click",            limit: 4
    t.string   "tpl",              limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "role",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
