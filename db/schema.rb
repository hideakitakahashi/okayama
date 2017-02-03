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

ActiveRecord::Schema.define(version: 20170201032043) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",           null: false
    t.string   "email_for_index", null: false
    t.string   "admin_name",      null: false
    t.string   "hashed_password"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "post_id"
    t.integer  "member_id"
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
  end

  create_table "infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "howto",      null: false
    t.string   "why",        null: false
    t.string   "vision",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",            null: false
    t.string   "email_for_index",  null: false
    t.string   "family_name",      null: false
    t.string   "family_name_kana", null: false
    t.string   "given_name",       null: false
    t.string   "given_name_kana",  null: false
    t.string   "hashed_password"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "image"
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",    limit: 65535
    t.integer  "member_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "category"
    t.string   "title"
    t.index ["member_id", "created_at"], name: "index_posts_on_member_id_and_created_at", using: :btree
    t.index ["member_id"], name: "index_posts_on_member_id", using: :btree
  end

  create_table "shops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.string   "category",   null: false
    t.string   "url"
    t.string   "email"
    t.string   "phone"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id", "created_at"], name: "index_shops_on_member_id_and_created_at", using: :btree
    t.index ["member_id"], name: "index_shops_on_member_id", using: :btree
  end

  create_table "signups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "posts", "members"
  add_foreign_key "shops", "members"
end
