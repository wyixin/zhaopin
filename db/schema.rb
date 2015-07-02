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

ActiveRecord::Schema.define(version: 20150702072539) do

  create_table "areas", force: :cascade do |t|
    t.integer  "city_id",    limit: 4
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.text     "text",            limit: 65535
    t.integer  "sub_category_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "source",          limit: 255
    t.integer  "click",           limit: 4
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree
  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

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

  create_table "industries", force: :cascade do |t|
    t.string   "name",       limit: 255
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
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "temptation",      limit: 255
    t.text     "duty",            limit: 65535
    t.text     "requirement",     limit: 65535
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "resume_attachments", force: :cascade do |t|
    t.integer  "resume_id",       limit: 4
    t.string   "attachment_file", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "resume_educations", force: :cascade do |t|
    t.integer  "user_id",              limit: 4
    t.string   "school",               limit: 255
    t.string   "speciality",           limit: 255
    t.string   "education",            limit: 255
    t.date     "start_time"
    t.date     "end_time"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "reward",               limit: 255
    t.string   "school_experience",    limit: 255
    t.string   "computer_ability",     limit: 255
    t.string   "foreign_language1",    limit: 255
    t.string   "foreign_language1_ls", limit: 255
    t.string   "foreign_language1_rw", limit: 255
    t.string   "foreign_language2",    limit: 255
    t.string   "foreign_language2_ls", limit: 255
    t.string   "foreign_language2_rw", limit: 255
    t.string   "mandarin",             limit: 255
    t.string   "other_skills",         limit: 255
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
    t.string   "wage",             limit: 255
    t.string   "district",         limit: 255
    t.string   "photo_img",        limit: 255
    t.string   "photo_audit",      limit: 255
    t.string   "talent",           limit: 255
    t.string   "complete_percent", limit: 255
    t.integer  "click",            limit: 4
    t.string   "tpl",              limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "educational",      limit: 255
    t.string   "address",          limit: 255
    t.string   "political_status", limit: 255
    t.string   "driving_license",  limit: 255
    t.integer  "driving_age",      limit: 4
    t.text     "evaluation",       limit: 65535
    t.integer  "intention_job_id", limit: 4
  end

  create_table "sub_categories", force: :cascade do |t|
    t.integer  "category_id", limit: 4
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "sub_industries", force: :cascade do |t|
    t.integer  "industry_id", limit: 4
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "sub_positions", force: :cascade do |t|
    t.integer  "position_id", limit: 4
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
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
